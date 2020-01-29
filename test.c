#include<stdio.h>
#include<x86_64-linux-gnu/sys/sdt.h>
int main()
{
    DTRACE_PROBE("hello-usdt","probe-main");
    return 0;
}