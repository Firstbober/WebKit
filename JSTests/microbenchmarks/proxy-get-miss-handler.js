var proxy = new Proxy({}, {});

for (var i = 0; i < 1e7; ++i)
    proxy.test;
