const stringReplace =(description)=>{
     return description.replace(/(.{80})/g, "aaaaa");

}

window.stringReplace = stringReplace;