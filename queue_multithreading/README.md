You can compile the code with this command:

    gcc -o divisor main.c queue.c -pthread

Command-line arguments:
The program uses four optional arguments to change parameters:

    -t: Number of worker threads (default 5)
    -q: The maximum size of the queue, which is shared by the threads (default 10)
    -r: The amount of the random numbers (default 20)
    -m: The possible range of the random numbers (default 100)

Generator Thread
The program creates one generator thread. This thread is generated random positive integers and insert them to the queue. The quantity of the numbers and their possible range is decided by the command-line arguments.

Worker Threads
These threads remove a number from the queue. They will sleep for a random amount of time (0.1 to 1 second with increments of 0.1 seconds). Finally, they will find the divisors of the numbers they removed and print the result. Then, they will start over until the generator finishes working. 

A result should be as follows:

    Thread ID: 3059108672, Number: 96, Divisors: 1 2 3 4 6 8 12 16 24 32 48 96
