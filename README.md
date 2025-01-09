# Race Condition in Asynchronous Swift Function

This repository demonstrates a race condition in an asynchronous Swift function and provides a solution to mitigate it.

## Bug Description

The `fetchData` function simulates an asynchronous operation.  If this function is called multiple times rapidly, the completion handler might be executed multiple times with overlapping results due to the asynchronous nature of `DispatchQueue.global().asyncAfter`. This leads to unpredictable behavior and potential data inconsistencies.

## Solution

The solution utilizes a semaphore to control the concurrent executions of the `fetchData` function.  This ensures that only one instance of the function runs at a time.