# Unhandled API Response Errors in Dart

This repository demonstrates a common error in Dart when handling API responses. The provided code fetches data from an API endpoint; however, error handling is insufficient to help identify the source of failures when things go wrong.  The solution showcases improved error handling and logging.

## Bug

The original code lacks specific error handling for different types of exceptions that might occur during the API call or JSON processing. This makes debugging difficult.  Additionally, the root cause of API errors isn't always evident.

## Solution

The improved solution demonstrates more robust error handling, including:

*   Specific exception handling for different error types (e.g., `FormatException`, `http.ClientException`)
*   Detailed logging for better debugging
*   Consideration of API response codes and error messages.