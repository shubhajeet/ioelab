import sys
import json
import os

labs = []
cond = sys.argv[1]
rootDir = "."
for dirName, subdirList, fileList in os.walk(rootDir, topdown=False):
    labs.append({"no":len(labs),"src":dirName,"description":dirName})
    files = []
    for fname in fileList:
        if cond in fname: 
            files.append({"src" : dirName + "/" + fname ,"description": fname})
    labs[-1]["files"] = files

template = {
    "title":input("title"),
    "repo":input("repo"),
    "description":input("description"),
    "labs":labs
}
fp = open("genapi.json","w")
json.dump(template,fp)
