// node render.js -> exports/elves-post.png (1080x1350) and exports/elves-story.png (1080x1920)
const {chromium}=require('playwright');const path=require('path');const fs=require('fs');
(async()=>{const out=path.join(__dirname,'exports');fs.mkdirSync(out,{recursive:true});
  const b=await chromium.launch();const errs=[];
  for(const [f,h] of [['post',1350],['story',1920]]){
    const p=await (await b.newContext({viewport:{width:1080,height:h},deviceScaleFactor:1})).newPage();
    p.on('pageerror',e=>errs.push(e.message));
    await p.goto('file://'+path.join(__dirname,process.argv[2]||'elves-poster.html')+(f==='story'?'?f=story':''));
    await p.waitForFunction(()=>document.body.dataset.ready||(document.getElementById('copy')&&document.getElementById('copy').children.length>0),null,{timeout:60000});
    await p.waitForTimeout(300);
    await (await p.$('#P')).screenshot({path:path.join(out,(process.argv[3]||'elves')+'-'+f+'.png')});}
  console.log('errors',JSON.stringify(errs));await b.close();})();
