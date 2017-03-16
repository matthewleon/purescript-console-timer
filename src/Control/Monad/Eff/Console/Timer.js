"use strict";

exports._time = function (s) {
  return function () {
    console.time(s);
    return {};
  };
};

exports._timeEnd = function (s) {
  return function () {
    console.timeEnd(s);
    return {};
  };
};
