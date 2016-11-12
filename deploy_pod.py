# -*- coding: utf-8 -*-

import os

if __name__ == '__main__':
    output = os.popen('git tag')
    text=output.read()
    arr=text.split('\n')
    print(arr)
    len=len(arr)
    tag=arr[len-2]

    wdLen=len(tag)
        