# -*- coding: utf-8 -*-

import os

if __name__ == '__main__':
    os.system('git add *')
    os.system('git commit -m "更新"')
    os.system("git push origin master")
    output = os.popen('git tag')
    text=output.read()
    arr=text.split('\n')
    print(arr)
    length=len(arr)
    tag=arr[length-2]

    if len(tag) >= 0:
        versionArray=tag.split('.')
        versionArray[2]=(str)((int)(versionArray[2])+1)
        new_version=versionArray[0]+'.'+versionArray[1]+'.'+versionArray[2]
        os.system('git tag -m "" '+new_version)
        os.system('git push --tags')
        spec_name=os.popen('ls *.podspec')
        print spec_name
