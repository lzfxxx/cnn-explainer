const fs = require('fs');
const path = require('path');

const bundlePath = path.join(__dirname, 'public', 'bundle.js');
if (!fs.existsSync(bundlePath)) {
  console.error('❌ bundle.js 不存在，请先执行 npm run build');
  process.exit(1);
}

const original = fs.readFileSync(bundlePath, 'utf-8');
const fixed = original.replace(/\/cnn-explainer\/assets\//g, '/assets/');

fs.writeFileSync(bundlePath, fixed, 'utf-8');
console.log('✅ 路径替换完成');