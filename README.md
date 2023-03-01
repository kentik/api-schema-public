# Kentik platform API schemas and pre-built code

## About Kentik APIs
The Kentik platform currently provides 2 generations of public APIs:
- legacy REST-only APIs, known as *API version 5*
- modern gRPC and REST APIs, known as *API version 6*

**This repository contains schemas and pre-built artifacts only for modern, version 6 APIs.**

More information about Kentik APIs (including legacy version 5 APIs) is available in
[Kentik Knowledge Base](https://kb.kentik.com/v0/Ab09.htm#Ab09-APIs_Overview).

## Version 6 APIs
Modern Kentik APIs are based on [gRPC](https://grpc.io/) utilizing [Protocol Buffers](https://protobuf.dev/) for
transfer encoding. All API schemas are defined in proto files using [version 3](https://protobuf.dev/programming-guides/proto3/) syntax.

REST/JSON APIs are also provided via automatic API translation using
[gRPC-Gateway](https://grpc-ecosystem.github.io/grpc-gateway/). 
[OpenAPI](https://spec.openapis.org/oas/latest.html) (a.k.a. Swagger) version 2 and 3 spec files are provided for all version 6 APIs.

### API versioning
Kentik APIs use [Calendar Versioning](https://calver.org/) with following format:

`v<YYYY><MM>[(alpha|beta)][<N>]`

where:
- `YYYY` is year number (e.g. 2022)
- `MM` is month number (e.g. 02, 11)
- `alpha` or `beta` suffix indicating life-cycle status of the API (see bellow)
- `N` optional serial number (used if more than 1 version must be introduced in the same month)

### API life-cycle status

APIs are in 1 of 3 possible stages based on their life-cycle status:
- *alpha*: experimental, incomplete and mostly untested APIs
- *beta*: functional, usable, but potentially incomplete APIs
- *stable*: mature API with the highest level of support

Suggestions for use of unstable APIs:
- *alpha* APIs **shall not be used for any production purposes**
- *beta* APIs **shall not be used for any critical use cases requiring long term support**.

The table bellow provides service level objectives for APIs based on their life-cycle status

| life-cycle status | backward compatibility within a version |               support for old versions |
|:------------------|:---------------------------------------:|---------------------------------------:|
| stable            |               guaranteed                | 12 months after release of new version |
| beta              |               guaranteed                |  6 months after release of new version |
| alpha             |             not guaranteed              |                                   none |

Stable APIs become *deprecated* as soon as a new version is released. Deprecated versions do not get any futher
development beyond critical bug fixes. Most importantly, they do not receive support for new features.

New features, extensions of existing functionality may be introduced in stable APIs as long as added functionality is
backwards compatible (i.e. does not allow aby changes in behavior of clients).

## Repository layout
- [proto](./proto) - Kentik API schemas
- [vendor proto](./protovendor) - API schemas utilized by Kentik APIs
- [gen](./gen) - pre-built artifacts
	- [proto descriptor file](./gen/proto/kentik-all.pb) containing all APIs and dependencies
	- pre-built API client and server stubs in
		- [Go](./gen/go)
		- [Python](./gen/go)
		- [C](./gen/go)
		- [C++](./gen/go)
	- OpenAPI specs
		- [v2](./gen/openapiv2)
		- [v3](./gen/openapiv3)
