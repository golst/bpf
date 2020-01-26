#include<stdio.h>
#include"bpf_load.h"

int main(int argc, char* argv[])
{
    if(load_bpf_file("hello.o")!=0)
    {
        printf("the kernel didn't load bpf program\n");
        return -1;
    }
    read_trace_pipe();
    return 0;
}