#!/usr/bin/env bash
# https://stackoverflow.com/questions/1103149/non-greedy-reluctant-regex-matching-in-sed
# sed doesn't support non-greedy

# replace [[page]] → {{<ref "page" >}}
perl -pi -e 's|\[\[(.*?)\]\]|[\1]({{< ref "\1" >}})|g' $1/*.md