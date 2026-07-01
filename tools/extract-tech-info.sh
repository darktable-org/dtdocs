#!/usr/bin/env bash
#
# Extract dt_iop_set_description technical info from a source file,
# and format it for a dtdocs md file.
#
# ##################

# Specify the awk program inside the script
# Start awk program
read -r -d '' AWK_SCRIPT <<'EOF'
# An awk script to extract technical info summary from a source file

BEGIN { foundSummaryCall=0; totalString = ""; }

# Look for the start of the dt_iop_set_description call
/return  *dt_iop_set_description/ { foundSummaryCall=1; }

# Build a single string with all the dt_iop_set_description args
/"/ {
  if (foundSummaryCall) {
    totalString = totalString $0;
  }
}

# Check for the end of the dt_iop_set_description call
/;$/ { foundSummaryCall=0; }

END {
  # If something was found, format and print
  if (totalString != "") {
    # Remove extra text in the string to have just the plain args strings
    totalString = gensub(/^[^"]*"/, "\"", "g", totalString)
    totalString = gensub(/" *"/, " ", "g", totalString)
    totalString = gensub(/ *\\n */, " ", "g", totalString)
    totalString = gensub(/_\("/, "\"", "g", totalString)
    totalString = gensub(/")/, "\"", "g", totalString)
    totalString = gensub(/, *"/, "\"", "g", totalString)
    totalString = gensub(/^ *"/, "", "g", totalString)
    totalString = gensub(/);$/, "", "g", totalString)

    # Split the different strings for the different parts of the info
    count = split(totalString, arr, "\"+")

    # Print out the summary
    print "{{< details summary=\"Technical information\" class=\"technical-info\" >}}\n";
    print "description";
    print ": " arr[1] ".\n";
    print "purpose";
    print ": " arr[2] ".\n";
    print "input";
    print ": " arr[3] ".\n";
    print "processing";
    print ": " arr[4] ".\n";
    print "output";
    print ": " arr[5] ".\n";
    print "{{< /details >}}\n";
  }

}
EOF
# End awk program

#
# #############################

# Start functions
#
function handleError {
  echo $1
  echo ""
  usage
  exit -1
}

function usage {
  echo `basename $0` "-h | --help | <file name>"
  echo ""
  echo "Attempts to extract the technical information summary from a processing module source file"
  echo "based on a call to dt_iop_set_description and formats for dtdocs md file."
  echo ""
  echo "<file name> - a darktable source file"
  echo ""
  echo "Examples:"
  echo "  `basename $0` src/iop/agx.c"
  exit $1
}

# Extract technical info 
function processFile {
  awk "$AWK_SCRIPT" $1
}

#
# End of functions
#
#

# Check for help arg
if [[ $1 == "-h" || $1 == "--help" ]] ; then
  usage
  exit 0
fi

# Check awk is available
if ! command -v awk >/dev/null 2>&1; then
    handleError "awk is not available - cannot process the source file"
fi

# Arg validity checks:
# * check a single option has been given
# * and that it is a file
if [[ $# != "1" || ! -f $1 ]] ; then
  handleError "Must specify exactly one source file"
fi

processFile $1
