function callNative(name, method, content) {
  let data = JSON.parse(content)
  switch (method) {
    case 'alert': {
      return flutterAlert(data)
    }
    case 'getSystemName': {
      return getSystemName(data)
    }
    case 'getData': {
      return getData(content)
    }
  }
}

function getData(content) {
  return [ {
               code: 0,
               success: true,
               list: ["a", "b", "c"],
               msg: "done"
             }]
}

function flutterAlert(content) {
  alert(content.data)
}

function getSystemName(content) {
  return getBrowserName()
}

function getBrowserName() {
  var userAgent = navigator.userAgent;
  if (userAgent.indexOf("Opera") > -1 || userAgent.indexOf("OPR") > -1) {
    return 'Opera';
  }
  else if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1) {
    return 'IE';
  }
  else if (userAgent.indexOf("Edge") > -1) {
    return 'Edge';
  }
  else if (userAgent.indexOf("Firefox") > -1) {
    return 'Firefox';
  }
  else if (userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1) {
    return 'Safari';
  }
  else if (userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1) {
    return 'Chrome';
  }
  else if (!!window.ActiveXObject || "ActiveXObject" in window) {
    return 'IE>=11';
  }
  else {
    return 'Unkonwn';
  }
}