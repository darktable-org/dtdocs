var lunrIndex;
var pagesIndex;
var pagesMap = {};
var SEARCH_RESULT_LIMIT = 20;
var SEARCH_RESULT_EXCERPT_LENGTH = 160;

function sanitizeRegex(src) {
    return src.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

// Initialize lunrjs using our generated index file
function initLunr() {
    var request = new XMLHttpRequest();
    request.open('GET', indexURL, true);

    request.onload = function () {
        if (request.status >= 200 && request.status < 400) {
            pagesIndex = JSON.parse(request.responseText);
            console.log('index:', pagesIndex);

            pagesIndex.forEach(function (page) {
                pagesMap[page.href] = page;
            });

            // Set up lunrjs by declaring the fields we use
            // Also provide their boost level for the ranking
            lunrIndex = lunr(function () {
                this.pipeline.remove(lunr.stemmer);
                this.searchPipeline.remove(lunr.stemmer);

                this.field('title', { boost: 5 });
                this.field('content', { boost: 2 });
                this.field('tags', { boost: 1 });

                // ref is the result item identifier (I chose the page URL)
                this.ref('href');
                this.add({ field: 'test', text: 'hello' });
                for (var i = 0; i < pagesIndex.length; ++i) {
                    this.add(pagesIndex[i]);
                }
            });
        } else {
            var err = textStatus + ', ' + error;
            console.error('Error getting Hugo index flie:', err);
        }
    };

    request.send();
}

function search(queryString, limit) {
    var queryTerms = lunr.tokenizer(queryString);
    var searchResults = lunrIndex.query(function (query) {
        queryTerms.forEach(function (queryTerm) {
            // look for an exact match and apply a large positive boost
            query.term(queryTerm, {
                usePipeline: true,
                boost: 100,
            });

            // look for terms that start or end with queryTerm and apply a medium boost
            query.term(queryTerm, {
                usePipeline: false,
                boost: 5,
                wildcard:
                    lunr.Query.wildcard.LEADING | lunr.Query.wildcard.TRAILING,
            });

            // look for terms that match with an edit distance of 1 and apply a small boost
            query.term(queryTerm, {
                usePipeline: false,
                editDistance: 1,
                boost: 1,
            });
        });
    });

    // Sort results by relevance
    searchResults.sort((a, b) => b.score - a.score);

    searchResults = searchResults.slice(0, limit);

    return searchResults;
}

function highlightKeyword(sourceText, keyword, tag) {
    if (!tag) tag = 'mark';

    return sourceText.replace(new RegExp(keyword, 'ig'), function (match) {
        return '<' + tag + '>' + match + '</' + tag + '>';
    });
}

function getTextExcerpt(text, keyword, length) {
    if (!length) length = 80;

    var index = text.search(new RegExp(keyword, 'ig'));
    var excerpt = text;

    if (index === -1) excerpt = text.substring(0, length) + '...';

    var halfLength = Math.round(length / 2);
    var excerpt = text.substring(
        Math.max(0, index - halfLength),
        Math.min(text.length, index + halfLength)
    );

    if (index - halfLength > 0) excerpt = '...' + excerpt;
    if (index + halfLength < text.length) excerpt = excerpt + '...';

    return excerpt;
}

function renderResults(results) {
    var searchResults = document.getElementById('search-results');
    var $searchResults = $(searchResults);

    if (!results.length) {
        $searchResults.hide();
        return;
    }

    var resultsFragment = document.createDocumentFragment();
    // Only show the first twenty results
    results.forEach(function (result) {
        var page = pagesMap[result.ref];
        var matchedTerms = Object.keys(result.matchData.metadata)
            .map(sanitizeRegex)
            .join('|');
        var link = document.createElement('a');
        var title = document.createElement('b');
        var content = document.createElement('small');

        link.className = 'search-results__item';
        title.className = 'search-results__title';
        content.className = 'search-results__content';

        link.href = page.href;
        title.innerHTML = highlightKeyword(page.title, matchedTerms);
        content.innerHTML = highlightKeyword(
            getTextExcerpt(
                page.content,
                matchedTerms,
                SEARCH_RESULT_EXCERPT_LENGTH
            ),
            matchedTerms
        );

        link.appendChild(title);
        link.appendChild(content);

        resultsFragment.appendChild(link);
    });
    searchResults.appendChild(resultsFragment);

    var header = document.querySelector('header.navbar');
    $searchResults.css('top', header.clientHeight);
    $searchResults.css('height', window.innerHeight - header.clientHeight);
    $searchResults.show();
}

function handleSearchInput() {
    var $searchInput = $('#search-input');
    var $searchResults = $('#search-results');
    var query = $searchInput.val();

    //trigger a search if a search term longer than two characters has been entered
    $searchResults.empty().hide();

    if (query.length < 2) {
        return;
    }

    renderResults(search(query, SEARCH_RESULT_LIMIT));
}

$(document).ready(function () {
    var $searchInput = $('#search-input');
    var $searchResults = $('#search-results');

    $searchResults.hide();
    $searchInput.focus(function () {
        //load index file if it's not already been loaded
        if (!lunrIndex) {
            initLunr();
        }
    });

    $searchInput.keydown(function (e) {
        if (e.keyCode === 27) {
            $searchResults.hide();
            $searchInput.val('');
        }

        if (e.keyCode === 13) {
            //enter key pressed - go to first search result if it exists
            e.preventDefault();

            $('#search-results a').first().get(0).click();
        }
    });

    $searchInput.on('input', handleSearchInput);
});
