self.addEventListener('install', (event) => {
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    (async () => {
      try {
        const names = await caches.keys();
        await Promise.all(names.map((name) => caches.delete(name)));
      } catch (_) {}

      try {
        await self.clients.claim();
      } catch (_) {}

      const windowClients = await self.clients.matchAll({
        type: 'window',
        includeUncontrolled: true,
      });

      await Promise.all(
        windowClients.map((client) => client.navigate(client.url)),
      );

      try {
        await self.registration.unregister();
      } catch (_) {}
    })(),
  );
});
