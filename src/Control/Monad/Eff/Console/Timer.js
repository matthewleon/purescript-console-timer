"use strict";

exports["time'"] = function (s) {
  return function () {
    console.time(s);
    return {};
  };
};

exports["timeEnd'"] = function (s) {
  return function () {
    console.timeEnd(s);
    return {};
  };
};
