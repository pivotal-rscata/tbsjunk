Not many steps required to make a custom stack

Add the following lines to the build image Dockerfile and the run image Dockerfile

```
LABEL "io.buildpacks.stack.id"="some id that matches what your buildpacks expect"
ENV CNB_STACK_ID="same id as in the LABEL command"
ENV CNB_USER_ID="the Linux user ID of the user in the image you want to use"
ENV CNB_GROUP_ID="the Linux group ID of the group in the image you want to use"
```

To find the stack ID for a custom stack you can check the source code for the buildpack. buildpack.toml contains the stack IDs for compatible stacks. The IDs are found in the `metadata` section in the `dependencies` subsections. 

Time to build my own Store image.
Find a target buildpack - Paketo Go. I want to add a new stack ID inside buildpack.toml so that I can force my custom stack as the only option.


The image in the Store is full of many different buildpacks. Don't forget that buildpacks are modular now. I think you were forgetting that. 
