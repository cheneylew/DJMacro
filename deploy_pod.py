# -*- coding: utf-8 -*-

import os,re

if __name__ == '__main__':
    output = os.popen('git tag')
    text=output.read()
    arr=text.split('\n')
    print(arr)
    length=len(arr)
    tag=arr[length-2]
    if len(tag) >= 0:
        #生成新版本号
        versionArray=tag.split('.')
        versionArray[2]=(str)((int)(versionArray[2])+1)
        new_version=versionArray[0]+'.'+versionArray[1]+'.'+versionArray[2]
        #查找podspec文件
        op1=os.popen('ls *.podspec')
        fileName=op1.read()
        fileName=fileName.replace('\n','')
        #读取仓库文件
        f=open(fileName,'r')
        content=f.read()
        version_re=re.compile('= \'\d+\.\d+\.\d+')
        new_content=version_re.sub('= \''+new_version,content)
        f.close()
        #写入版本号
        file_object = open(fileName, 'w')
        file_object.write(new_content)
        file_object.close()
        #打tag
        os.system('git tag -m "" '+new_version)
        os.system('git push --tags')
        #推送本地文件到远程
        os.system('git add *')
        os.system('git commit -m "更新"')
        os.system("git push origin master")
        #更新仓库
        os.system('pod repo push Specs '+fileName+' --allow-warnings')
        os.system('pod repo update')
