echo "Analyzing logs..."

LOG_FILE="sample.log"

echo "---- Errors ----"
grep "ERROR" $LOG_FILE

echo "---- Warnings ----"
grep "WARNING" $LOG_FILE

echo "Analysis complete."
