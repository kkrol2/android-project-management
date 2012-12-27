var __t;

__t = function(ns) {
  var curr, index, part, parts, _i, _len;
  curr = null;
  parts = [].concat = ns.split(".");
  for (index = _i = 0, _len = parts.length; _i < _len; index = ++_i) {
    part = parts[index];
    if (curr === null) {
      curr = eval(part);
      continue;
    } else {
      if (curr[part] == null) {
        curr = curr[part] = {};
      } else {
        curr = curr[part];
      }
    }
  }
  return curr;
};


document.write('<scri'+'pt src="/assets/utils.js?body=1"></scr'+'ipt>')
document.write('<scri'+'pt src="/assets/my_storage.js?body=1"></scr'+'ipt>')
document.write('<scri'+'pt src="/assets/todo_use_case.js?body=1"></scr'+'ipt>')
document.write('<scri'+'pt src="/assets/todo_gui.js?body=1"></scr'+'ipt>')
document.write('<scri'+'pt src="/assets/web_glue.js?body=1"></scr'+'ipt>')
document.write('<scri'+'pt src="/assets/todo_app.js?body=1"></scr'+'ipt>')