+++
title = "Remove an audio track from a video file"
+++


View info about tracks:

```
mkvmerge -i input.mkv
```

Keep track 2 only:

```
mkvmerge -o outfile.mkv --atracks 2 infile.mkv
```

Keep tracks 1, 2:

```
mkvmerge -o outfile.mkv --atracks 1,2 infile.mkv
```

Do for all files in dir:

```
for f in *.mkv; do mkvmerge -o "stripped-${f}" --atracks 2 $f ; done
```

---
## Backlinks
* [Open Source video editing software]({{< ref "Open Source video editing software" >}})
	* Allows to edit container video files; e.g. [Remove an audio track from a video file]({{< ref "Remove an audio track from a video file" >}})

