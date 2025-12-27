'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "c84a1e37d4bb327878a8d63eef755475",
"assets/AssetManifest.bin.json": "5bad3f7c12ae58555cdffed5301098e6",
"assets/assets/fonts/OpenSans-Bold.ttf": "69709f078a6f54896ec90f22c602eb4e",
"assets/assets/fonts/OpenSans-ExtraBold.ttf": "9e61c03dc1cf642d134bad2b96e7968f",
"assets/assets/fonts/OpenSans-Light.ttf": "68e60202714c80f958716e1c58f05647",
"assets/assets/fonts/OpenSans-Medium.ttf": "054f9839e83cc5e68a9343055c7ebac7",
"assets/assets/fonts/OpenSans-Regular.ttf": "554f2471c4a6d6dfc92939ea0a418f00",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/images/agruino.png": "7edc42b6e22c79f047fa94469c68043c",
"assets/assets/images/blink.png": "050f9356cbec5968c355d42e120b7971",
"assets/assets/images/bluecollerio.png": "d5b6a31f112a325b0485392e3d4dc21b",
"assets/assets/images/d_alert.png": "9877902a62b97d51db2531b4c7a5704c",
"assets/assets/images/enstva.png": "4b9d1e0cefe9d501da4894253299d30f",
"assets/assets/images/eventally.png": "f49626a561250ac75bdbe91ad50c67d2",
"assets/assets/images/kerala.png": "efe2f851174125b8c18073054227cec9",
"assets/assets/images/profile.png": "84946955232e578da4d26f70ef8e2e3c",
"assets/assets/images/tudu.png": "2c10c32a2f842230cfdb64d2b25d6998",
"assets/assets/svg/csharp.svg": "17dc998bccce030e401194552ea05236",
"assets/assets/svg/dark_mode.svg": "6d60f99a104584a1870c012a6110643b",
"assets/assets/svg/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/svg/download.svg": "b06614c95cf0beaeead13117933957f9",
"assets/assets/svg/firebase.svg": "cef7c97ac5ad507248af8075e5f58c50",
"assets/assets/svg/flutter.svg": "fae6a382059c0b50202d0acd3edc9d2f",
"assets/assets/svg/git.svg": "0192560034c6b7970c926e75dff17fdf",
"assets/assets/svg/github.svg": "c23a95fcb4b1d25765107e4e73b06438",
"assets/assets/svg/heart.svg": "d0908de09cc3bddadd8f0c7c0ff78f26",
"assets/assets/svg/hi.svg": "cad6b14632b050dc0b82075d24632707",
"assets/assets/svg/light_mode.svg": "7bdcea57fc18248fb8379e979c241d32",
"assets/assets/svg/logo.svg": "ba5271785153e27c51fe80e5eab6cc91",
"assets/assets/svg/menu.svg": "42b7debec56b34ace43cd48e380dd5a9",
"assets/assets/svg/postman.svg": "fbfb57a181ce251926d686d12e6cee5a",
"assets/assets/svg/python.svg": "c73fc780c848b15821a97098596fb1f1",
"assets/assets/svg/share.svg": "616b2b941dc53bbcbcf3590e273ad7b6",
"assets/assets/svg/sql.svg": "c86ac4ebe031747e19e75545969aa591",
"assets/FontManifest.json": "0e137f1ce00f073cf809a2182ee420ef",
"assets/fonts/MaterialIcons-Regular.otf": "9b44a0b83c0c84e8b2c122cecdc133df",
"assets/loading.gif": "62e9aee76fda3cbf7562a641771499e1",
"assets/NOTICES": "07cc1d2d84e0a6af3007314c01290d85",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "893779adf361c651acdf8f8af5d76f94",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "f27486d413acfb9a0bcac7e3e60ecbbc",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "d574729ab35c5f15aa1c01d79f064c5a",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "3c62c4409b4bfd6271ae01ee7b5e6086",
"icons/Icon-192.png": "68dc4f12dc74b8dc8a1450a20a05d2c6",
"icons/Icon-512.png": "b12f2a7cc82732d6832a6a75ccbda26e",
"icons/Icon-maskable-192.png": "68dc4f12dc74b8dc8a1450a20a05d2c6",
"icons/Icon-maskable-512.png": "b12f2a7cc82732d6832a6a75ccbda26e",
"index.html": "dc34088d8b5b52bcfef417cfc559a289",
"/": "dc34088d8b5b52bcfef417cfc559a289",
"main.dart.js": "7196fd72d061cea2d9b1b686cc103979",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "0ab19e2a759b87282e92f6903f71b6dd"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
