const PROXY_CONFIG = [
  {
    context: ["/v8"],
    target: "https://query2.finance.yahoo.com/",
    secure: false,
    changeOrigin: true,
    pathRewrite: {
      "^/": "",
    },
  },
];

module.exports = PROXY_CONFIG;
