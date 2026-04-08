LOG_FILE=$1

if [ -z "$LOG_FILE" ]; then
    echo "Usage: ./log_analyzer.sh <logfile>"
    exit 1
fi

echo "Analyzing logs from $LOG_FILE..."
echo "----------------------------------"

ERROR_COUNT=$(grep -c "ERROR" $LOG_FILE)
WARNING_COUNT=$(grep -c "WARNING" $LOG_FILE)

echo "Total Errors: $ERROR_COUNT"
echo "Total Warnings: $WARNING_COUNT"

echo ""
echo "---- Error Details ----"
grep "ERROR" $LOG_FILE

echo ""
echo "---- Warning Details ----"
grep "WARNING" $LOG_FILE

echo ""
echo "Analysis complete."

./log_analyzer.sh sample.log > report.txt

