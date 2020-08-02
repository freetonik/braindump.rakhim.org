+++
title = "Authorized access to static HTML"
+++


I need users to access static HTML via an emailed magic link. JWTs are issued by a 3rd party. What is the simplest way to achieve this? I don't want to deploy a whole app. 

## Options

1. Serverless function + Auth0 (or other auth provider). 
	1. Cloudflare workers can store HTML in a KV storage and serve ([example](https://developers.cloudflare.com/workers/templates/pages/sites/)). 
		- all in one
		- fast and pretty simple
		- automatic global CDN
		- $5/month
		- toolkit includes npm and webpack
		- [see also](https://developers.cloudflare.com/workers/sites/start-from-worker)
	2. Netlify/lambda/whatever serverless fn sets a cookie, simple nginx restricts access by cookie
		-  simpler static deploy (rsync/whatever to nginx host)
		-  separated auth logic
2. Cloudflare worker fetching and serving HTML from another host ([example](https://developers.cloudflare.com/workers/templates/pages/fetch_html/)).
	- probably finnicky due to origin policies, etc.
	- need to protect the host 
		- maybe basic auth + worker's `fetch` with basic auth headers is enough?
3. Serverless worker fetching HTML from object storage ([example](https://cloudflareworkers.com/#07472eb75b9d1bfebc464c197a19bc23:https://example.com/index.html))
4. Plain RoR/Django/Whatever app. All logic and assets on one server. Fewer moving parts.
5. nginx + auth. Need something like [vouch](https://github.com/vouch/vouch-proxy).
	- [Use nginx to Add Authentication to Any Application | Okta Developer](https://developer.okta.com/blog/2018/08/28/nginx-auth-request) 

### Flow example
1. 3rd party triggers an event, sends to Zapier (or Integromat)
2. Zapier gets a unique KEY via get request to secret microservice (requires auth)
3. Zapier sends en email with magic link with encoded KEY. Link points to the main service.
4. Main service receives a request:
	1. KEY.invalid? OR no cookie? deny
	2. KEY.valid? 
		1. set cookie
		2. show content
	3. No KEY?
		1. cookie? serve
		2. no cookie? deny

### Licence key example
1. Sell access via gumroad, let it generate licence keys
2. Magic link with key embedded 
3. Simple serverless fn sets cookie from the link
4. Redirects to nginx-served site protected by a cookie