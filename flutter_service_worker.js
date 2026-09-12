'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "ad0bb0153d88313ece15916a42ea9b33",
".git/config": "32a7437605ff37ec7c9be36045c1559e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "e9f8f5640b15b649f210699e693de71c",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "7920c08592bdbee31fcef8c95e957227",
".git/logs/refs/heads/gh-pages": "7920c08592bdbee31fcef8c95e957227",
".git/logs/refs/remotes/origin/gh-pages": "d622a68334cff204eab8672b190a6b46",
".git/objects/04/0afc2289af6bf5b0331e72fe26175cc394713d": "4c7850290d115a5ef9acd4096f984dbb",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/11/048730949d58a367445b37d7947d4bedf5904a": "06f90637bbf4781b5ee1db8ad0ab2254",
".git/objects/11/a56e87741f9c0f63ecfbe3e047bfd0471d0bf0": "cccf7d6ba2a9430b92dfffbbced157f6",
".git/objects/12/3714fa9bf7159753e4452a7329f224f94921d7": "f6ab6289ca0c68a9ac69c5b7d789d0b1",
".git/objects/13/23cdac34c6ae8f7e1f8a2f3adc299eae7bdcea": "14c53dcf389f9fd3a26d012494e074b7",
".git/objects/16/14602939f900b680c0464335112b8dca659a32": "a9521b6a2987542cc157034998893241",
".git/objects/19/6895746f7ada11987d214a942164e0736dc6c1": "b1559feaaf69da61f24bedb17a90746b",
".git/objects/1a/d58d750a15ceb5e77f1c10c8997f6c80c4e4ea": "5f416395e58101b6098c8c73078b5984",
".git/objects/1d/b4f86884654dc366f39736acaeb51660b3f2e7": "2789e2c344fa1ad00b4abfbd2386ffe9",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/21/f34842ede4b384289c6216ba71d11b4829472a": "d17527900dabef892f923042fed7cb99",
".git/objects/23/0b7d736337429350725abf99cf43749ca49758": "2240fbbf9e4c065a3c15ea3f05c6306d",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/29/62272b4408d7072aa8522e8850330f92c18cf8": "3834c7c23c2042854d4a86430e1a12a4",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/36/7401ca31598d8eac170aafdb733bbb82f7c00e": "5afaa090749bb52ac3f86f57b6b7c06d",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/3b/7e74c86ddf8f87399f0a1d4187f78737f25419": "c35abf9819669ec69d6cee45a0cc3c3a",
".git/objects/3d/330b63af92f9595efbe8a7e8f3166d47618d07": "298dbf98fcd59af99de54ae2e4a050cf",
".git/objects/3e/cf666ee8c667d79c2b0215528b8c1c98c71c31": "b04c3501924433706e42a87f008fc95b",
".git/objects/40/0d5b186c9951e294699e64671b9dde52c6f6a0": "f6bd3c7f9b239e8898bace6f9a7446b9",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/49/3e549ca6718d9fbf107ad9b5003e54cf8672c0": "bdb73b6097600152a2faa83342d082de",
".git/objects/55/a68d9d09bd6b39b9db8712296f8d7fc62b0ebb": "40415baa9e194a881d715452c09a8271",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/72/4b855f4491be10f52265a8f3ef2f5e28c86c27": "485a489124b608a2297f9652d39506ae",
".git/objects/79/b3a4d93454f70c49f5d6ba1160b82c333b9bbe": "8f02a790cb22cffaa11a381a982d5202",
".git/objects/7a/18fbb0952a75cebc4be2f853dae100a86fd822": "9d43789a9114c14393c7c9f87da5d128",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/59f7ed73ab9a6038091b101371a1c5fc6d5257": "05eaf0c12d39405b6b770f3959acb306",
".git/objects/88/75b4040365ba6428fe9e5b621a2cd8aae6c142": "9bd7aa5127c70a5ea1725de01e58f83f",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/9a/0dea2ae1926fdc709399fa3bae048d062b729c": "d5e2c1e45111b50ba6a654f702cea39c",
".git/objects/9d/c65327b7a724d0cc0e1206527c740568542c48": "5b9b7790770c25d8b63b0c73acb76e96",
".git/objects/a6/0e736b525708c1cacc39284731d1d9d70b886a": "f6d7c33790e9d8bbc9505b48351abf44",
".git/objects/a6/8e535c428455502989e68796c0e94239b9566b": "b8fb3b60ea51c037f8e5e99d9ae9e1ad",
".git/objects/ad/37e2c2c9d586095623ec6b10e8eccbeb6e36d3": "b88a51a355cc925a9bdc18509ccf1ba3",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b7/8e0f8875c1c6bc54e145be410aa0c01232c25e": "76907d013816ee114ce53be3b890c97f",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/bd/67ad000cd56a161c314d46a45d2f1d0e7b97b5": "e7b0f917a1fd5ed980b4dde730b58fed",
".git/objects/c1/c6aeab0fc53667c3161c11dbf3a57aef89cd3b": "46fd947d5e0d5bb3f1c23a18b323e43b",
".git/objects/cc/1bb125e029c5917dadf4147e4c6f2d18769ae3": "b424ad3c12b36246b1486365597bd573",
".git/objects/cc/e2da67f1713b53e77007de4e0d398a0bdcf84a": "e68b4aff0d8b267b53c4e60ca6a9673d",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/d3/7fe76eb063d507cce866bb0b051148050b6fb8": "9c41bf6a28a83669e9b753941a75fc2e",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/a6d7122df8217d91ac68d56d24a823c5af98b8": "ff4553441696f0d92733465ac4f902f4",
".git/objects/d5/bb50b3c3bc534b51ba035a5e8495ba7af5025b": "81d30e6f235d2cd1960b1a0d917b3043",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/e6/97dc8bd461688392c16b7dbe048bdc432b93f7": "2b509895476f6ce68d7e562a6fdcfbbf",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/e8/8b11621aaceaf481057ece80ed17689826a4c4": "6617eee75127daf16de2b82800a8033a",
".git/objects/ee/8222560bd9c82309e42fceb80734f6d3ddd457": "9b70fbc523dfde22a144d1e371428930",
".git/objects/f0/7cb276c0022810c0ed021b756a0159c9f7f754": "4dbc8636b2bb564eca49f19fc91b1ef3",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/0a21274d951fdcad96fcb2d68cf53337e8521b": "9643896fb2cbec54fd49bcd7dd93e018",
".git/objects/fc/c122470555b36a361f8bec339791e3bf34afce": "14c341193c53be49cdd17043ef66d269",
".git/objects/fe/69109f3264400569ab9f5da3a42fc67fe82c1d": "79d4210f48e246c3a2f4a22e24f59e1e",
".git/refs/heads/gh-pages": "89526ff8c44e98a5b71f4badb557c9a4",
".git/refs/remotes/origin/gh-pages": "89526ff8c44e98a5b71f4badb557c9a4",
"404.html": "008b5a045d498eb50ebcfaf4f1840b34",
"assets/AssetManifest.bin": "f65dec496c8607543b55e3c6e002bcb7",
"assets/AssetManifest.bin.json": "36970335244f2b9e8b0425c839ffd6f8",
"assets/AssetManifest.json": "76764c23103713599256c6c7501147b5",
"assets/assets/images/clinic_pro_screen.png": "b73f1173211b9ebb6a19b5fa312229ce",
"assets/assets/images/kemet_odyssey_screen.png": "f171e2ffba8d5b16b941be71dd87b71e",
"assets/assets/images/michael_emad.jpg": "8588e68f5c40f5423f5c7d90c6888aa9",
"assets/assets/images/portfolio_overview.png": "037b1e842e92c06cd205669be8cca16d",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "6de2b9bd1e1f20a6138aef975e278314",
"assets/NOTICES": "8c6a625b28849b35ef1fba0c2263bd5a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "8c33d88d2c4e3d33b2d55f70e7d42f72",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "c9bdd5d0f779e2aaa83ab03082a5b6b7",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "9a505d6d9243391e90681fc0dab74658",
"icons/Icon-192.png": "16feed0340698891cf46739a9b480ab8",
"icons/Icon-512.png": "1f3d3506319d36075c0894b8183e9071",
"icons/Icon-maskable-192.png": "aaef7c4e8de7c9632050c2610be71dcc",
"icons/Icon-maskable-512.png": "31b2ec13ad7554df111b96790ba2c24e",
"index.html": "145f245a134cfcc1c4dd5aaa8c377d83",
"/": "145f245a134cfcc1c4dd5aaa8c377d83",
"main.dart.js": "504467169927e6f0edd5f38212e053b2",
"manifest.json": "224a8d94eb04b7be094c3d292162b519",
"vercel.json": "61bd31a2b0ac08f10f13c932b32d6ca1",
"version.json": "cb25d681e24d9de27b7cd89e47cf9c72",
"_redirects": "5f52dbefcf63c9f677ace09fcf8bc7d8"};
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
