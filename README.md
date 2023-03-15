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
backwards compatible (i.e. does not allow any changes in behavior of clients).

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
	- OpenAPI specs/gen
		- [v2](./gen/openapiv2)
		- [v3](./gen/openapiv3)

## Using the generated code

### Go
The repository is configured to provide installable Go package named `github.com/kentik/api-schema-public`.
Individual APIs
```go
import <alias> "github.com/kentik/api-schema-public/gen/go/kentik/<api_name>/<api_version>"
```
It is recommended to always explicitly specify the import alias. If no alias is specified, API objects are imported
with name specified in the last component of the `go_package` option value (after `;`) in the corresponding proto file.
For example the `go-package` option of the Synthetics API is
`github.com/kentik/api-schema-public/gen/go/kentik/synthetics/v202202;synthetics`, so the following code is valid:
```go
import (
	"fmt"
	"github.com/kentik/api-schema-public/gen/go/kentik/synthetics/v202202"
)

func main() {
	fmt.Println(synthetics.TestStatus_TEST_STATUS_ACTIVE)
}
```

## Python
The repository is configured to allow installation of package named `kentik-api-proto` containing code for all Kentik APIs
directly from GitHub using pip:
```
pip install git+https://github.com/kentik/api-schema-public.git
```
The repo-spec string can also be used in `requirements.txt`.
Locally the package can be built in the checked out repo with:
```
python -m build
```
which creates Python "wheel" package in the `dist/` directory.

With the `kentik-api-proto` package installed, protobuf messages and gRPC client stubs can be imported from
the `kentik` namespace. Examples:
```python
from kentik.synthetics.v202202.synthetics_pb2 import ListTestsRequest
from kentik.synthetics.v202202.synthetics_grpc import SyntheticsAdminServiceStub
```
The Python code requires the [grpclib](https://pypi.org/project/grpclib/) package which is installed as dependency.

**Caveats**:
1) As of now, the Python code requires `PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python` to be set in the environment. __This will be fixed in the near future.__
2) Using any `gRPC` services requires [asyncio](https://docs.python.org/3/library/asyncio.html) style programming. Aall methods of `<service>Stub` classes return [asyncio futures](https://docs.python.org/3/library/asyncio-future.html). 
