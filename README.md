# tg-panic-demo

```
macOS: Sequoia 15.7.1

❯ tofu --version
OpenTofu v1.10.7
on darwin_arm64
```

Stripped down prod repo representing different behaviour of
`terragrunt run --all *` between terragrunt versions (0.88.1, 0.89.3, 0.93.3).

**repo layout**

```
.
├── modules/
│   └── test/
│       └── module.hcl           # shared include consumed by children; wires vars/secrets
└── test/
    ├── inputs.yaml              # module inputs
    └── terragrunt.hcl           # barebones; calls read_terragrunt_config("../modules/test/module.hcl")
```

## results

### terragrunt 0.88.1
```
❯ terragrunt_0_88_1 --version
terragrunt version v0.88.1
❯ terragrunt_0_88_1 run --all plan
10:58:15.522 INFO   The runner at . will be processed in the following order for command plan:
Group 1
- Unit ./test


10:58:15.573 INFO   [test] Downloading Terraform configurations from . into ./test/.terragrunt-cache/2gVm5k4YS1nczOVy4IB4MU5LCf0/8NBn3rTIYwvYDbY37H0fmiDP_Ww
10:58:15.598 INFO   [test] tofu: Initializing the backend...
10:58:15.598 INFO   [test] tofu: Initializing provider plugins...
10:58:15.598 INFO   [test] tofu: OpenTofu has been successfully initialized!
10:58:15.598 INFO   [test] tofu:
10:58:15.598 INFO   [test] tofu: You may now begin working with OpenTofu. Try running "tofu plan" to see
10:58:15.599 INFO   [test] tofu: any changes that are required for your infrastructure. All OpenTofu commands
10:58:15.599 INFO   [test] tofu: should now work.
10:58:15.599 INFO   [test] tofu: If you ever set or change modules or backend configuration for OpenTofu,
10:58:15.599 INFO   [test] tofu: rerun this command to reinitialize your working directory. If you forget, other
10:58:15.599 INFO   [test] tofu: commands will detect it and remind you to do so if necessary.
10:58:15.624 STDOUT [test] tofu: Changes to Outputs:
10:58:15.624 STDOUT [test] tofu:   + debug = "foo"
10:58:15.624 STDOUT [test] tofu: You can apply this plan to save these new output values to the OpenTofu
10:58:15.624 STDOUT [test] tofu: state, without changing any real infrastructure.
10:58:15.624 STDOUT [test] tofu:
10:58:15.624 STDOUT [test] tofu: ─────────────────────────────────────────────────────────────────────────────
10:58:15.624 STDOUT [test] tofu: Note: You didn't use the -out option to save this plan, so OpenTofu can't
10:58:15.624 STDOUT [test] tofu: guarantee to take exactly these actions if you run "tofu apply" now.
```

### terragrunt 0.89.3
```
❯ terragrunt_0_89_3 --version
terragrunt version v0.89.3
❯ terragrunt_0_89_3 run --all plan
10:59:12.217 INFO   Using runner pool for stack .
10:59:12.230 ERROR  Error: Invalid function argument
10:59:12.230 ERROR    on ./modules/test/module.hcl line 3, in locals:
10:59:12.230 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
10:59:12.230 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
10:59:12.230 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
10:59:12.230 ERROR  this result from an attribute of that resource.
10:59:12.230 ERROR  Error: Invalid function argument
10:59:12.230 ERROR    on ./modules/test/module.hcl line 3, in locals:
10:59:12.230 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
10:59:12.230 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
10:59:12.230 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
10:59:12.230 ERROR  this result from an attribute of that resource.
10:59:12.231 ERROR  Error: Unsupported attribute
10:59:12.231 ERROR    on ./modules/test/module.hcl line 19:
10:59:12.231 ERROR    19: inputs = local.inputs
10:59:12.231 ERROR  This object does not have an attribute named "inputs".
10:59:12.231 ERROR  Error: Invalid function argument
10:59:12.231 ERROR    on ./modules/test/module.hcl line 3, in locals:
10:59:12.231 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
10:59:12.231 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
10:59:12.231 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
10:59:12.231 ERROR  this result from an attribute of that resource.
10:59:12.232 ERROR  Error: Invalid function argument
10:59:12.232 ERROR    on ./modules/test/module.hcl line 3, in locals:
10:59:12.232 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
10:59:12.232 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
10:59:12.232 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
10:59:12.232 ERROR  this result from an attribute of that resource.
10:59:12.232 ERROR  Error: Unsupported attribute
10:59:12.232 ERROR    on ./modules/test/module.hcl line 19:
10:59:12.232 ERROR    19: inputs = local.inputs
10:59:12.232 ERROR  This object does not have an attribute named "inputs".
10:59:12.232 ERROR  Error: Attempt to get attribute from null value
10:59:12.232 ERROR    on ./test/terragrunt.hcl line 13:
10:59:12.232 ERROR    13: generate = local.config.generate
10:59:12.232 ERROR  This value is null, so it does not have any attributes.
10:59:12.232 ERROR  Error: Attempt to get attribute from null value
10:59:12.232 ERROR    on ./test/terragrunt.hcl line 14:
10:59:12.232 ERROR    14: inputs   = local.config.inputs
10:59:12.232 ERROR  This value is null, so it does not have any attributes.
10:59:12.232 ERROR  Error: Attempt to get attribute from null value
10:59:12.232 ERROR    on ./test/terragrunt.hcl line 10, in terraform:
10:59:12.232 ERROR    10:   source = local.config.locals.source
10:59:12.232 ERROR  This value is null, so it does not have any attributes.
10:59:12.232 ERROR  Error: Unsuitable value type
10:59:12.232 ERROR    on ./test/terragrunt.hcl line 10, in terraform:
10:59:12.232 ERROR    10:   source = local.config.locals.source
10:59:12.232 ERROR  Unsuitable value: value must be known
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x2 addr=0xb8 pc=0x1062af4d8]

goroutine 72 [running]:
github.com/gruntwork-io/terragrunt/config.(*TerragruntConfig).Merge(0x140009ba3a8?, {0x1076ca110?, 0x140009ba3a8?}, 0x140006b1ae0?, 0x2?)
	/home/circleci/project/config/include.go:242 +0x28
github.com/gruntwork-io/terragrunt/config.handleInclude(0x14000bf98c0, {0x1076ca110, 0x140009ba3a8}, 0x0, 0x0)
	/home/circleci/project/config/include.go:157 +0x358
github.com/gruntwork-io/terragrunt/config.ParseConfig(0x140003e1290, {0x1076ca110, 0x140009ba3a8}, 0x140004a05e0, 0x0)
	/home/circleci/project/config/config.go:1352 +0x5b4
github.com/gruntwork-io/terragrunt/config.ParseConfigFile.func1({0x1076ca5f0?, 0x1400012bd1c?})
	/home/circleci/project/config/config.go:1222 +0x378
github.com/gruntwork-io/terragrunt/telemetry.(*Meter).Time(0x140000d8b80?, {0x1076a1fc8?, 0x140003e1290?}, {0x1068394b7?, 0x140000d8c88?}, 0x10724a980?, 0x107069de0?)
	/home/circleci/project/telemetry/meter.go:76 +0x1ac
github.com/gruntwork-io/terragrunt/config.ParseConfigFile.(*Telemeter).Collect.func2({0x1076a1fc8?, 0x140003e1290?})
	/home/circleci/project/telemetry/telemeter.go:59 +0x40
github.com/gruntwork-io/terragrunt/telemetry.(*Tracer).Trace(0x10724a980?, {0x1076a1fc8?, 0x140003e1290?}, {0x1068394b7?, 0x106e88de0?}, 0x20?, 0x14000581008?)
	/home/circleci/project/telemetry/tracer.go:182 +0x120
github.com/gruntwork-io/terragrunt/telemetry.(*Telemeter).Collect(...)
	/home/circleci/project/telemetry/telemeter.go:58
github.com/gruntwork-io/terragrunt/config.ParseConfigFile(0x140003e1290, {0x1076ca110, 0x140009ba3a8}, {0x140001d4a00, 0x32}, 0x0)
	/home/circleci/project/config/config.go:1175 +0x224
github.com/gruntwork-io/terragrunt/internal/discovery.(*DiscoveredConfig).Parse(0x14000c1e910, {0x1076a1690, 0x14000a08000}, {0x1076ca110, 0x140009ba3a8}, 0x14000912908, 0x1, {0x0, 0x0, 0x0})
	/home/circleci/project/internal/discovery/discovery.go:480 +0x49c
github.com/gruntwork-io/terragrunt/internal/discovery.(*Discovery).parseWorker(0x140007bc000, {0x1076a1690, 0x14000a08000}, {0x1076ca110, 0x140009ba3a8}, 0x14000912908, 0x14000a04000, 0x14000a04070)
	/home/circleci/project/internal/discovery/discovery.go:821 +0xb0
github.com/gruntwork-io/terragrunt/internal/discovery.(*Discovery).parseConcurrently.func2()
	/home/circleci/project/internal/discovery/discovery.go:783 +0x2c
golang.org/x/sync/errgroup.(*Group).Go.func1()
	/home/circleci/go/pkg/mod/golang.org/x/sync@v0.17.0/errgroup/errgroup.go:93 +0x4c
created by golang.org/x/sync/errgroup.(*Group).Go in goroutine 22
	/home/circleci/go/pkg/mod/golang.org/x/sync@v0.17.0/errgroup/errgroup.go:78 +0x90
```

debug output:
```
❯ terragrunt_0_89_3 run --all plan --log-level debug
11:00:08.126 DEBUG  Terragrunt Version: 0.89.3
11:00:08.127 DEBUG  Running command: tofu -version
11:00:08.127 DEBUG  Engine is not enabled, running command directly in .
11:00:08.150 DEBUG  tofu version: 1.10.6
11:00:08.150 DEBUG  Auto provider cache dir enabled: TF_PLUGIN_CACHE_DIR=../../Library/Caches/terragrunt/providers
11:00:08.150 DEBUG  Searching for stack files in .
11:00:08.151 INFO   Using runner pool for stack .
11:00:08.152 DEBUG  Found locals block: evaluating the expressions.
11:00:08.153 DEBUG  Running command: git rev-parse --show-toplevel
11:00:08.153 DEBUG  Command output will be suppressed.
11:00:08.159 DEBUG  git show-toplevel result:


.

11:00:08.159 DEBUG  [modules/test] Found locals block: evaluating the expressions.
11:00:08.159 DEBUG  [modules/test] Running command: git rev-parse --show-toplevel
11:00:08.159 DEBUG  [modules/test] Command output will be suppressed.
11:00:08.165 DEBUG  [modules/test] git show-toplevel result:


.

11:00:08.165 ERROR  Error: Invalid function argument
11:00:08.165 ERROR    on ./modules/test/module.hcl line 3, in locals:
11:00:08.165 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
11:00:08.165 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
11:00:08.165 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
11:00:08.165 ERROR  this result from an attribute of that resource.
11:00:08.165 DEBUG  [modules/test] Evaluated 1 locals (remaining 0): source
11:00:08.165 DEBUG  [modules/test] Encountered error while evaluating locals in file ./modules/test/module.hcl
11:00:08.165 DEBUG  [modules/test] Found locals block: evaluating the expressions.
11:00:08.165 ERROR  Error: Invalid function argument
11:00:08.165 ERROR    on ./modules/test/module.hcl line 3, in locals:
11:00:08.165 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
11:00:08.165 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
11:00:08.165 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
11:00:08.165 ERROR  this result from an attribute of that resource.
11:00:08.165 DEBUG  [modules/test] Evaluated 1 locals (remaining 0): source
11:00:08.165 DEBUG  [modules/test] Encountered error while evaluating locals in file ./modules/test/module.hcl
11:00:08.166 ERROR  Error: Unsupported attribute
11:00:08.166 ERROR    on ./modules/test/module.hcl line 19:
11:00:08.166 ERROR    19: inputs = local.inputs
11:00:08.166 ERROR  This object does not have an attribute named "inputs".
11:00:08.166 DEBUG  Evaluated 0 locals (remaining 0):
11:00:08.166 DEBUG  Encountered error while evaluating locals in file ./test/terragrunt.hcl
11:00:08.166 DEBUG  Did not find any locals block: skipping evaluation.
11:00:08.166 DEBUG  [Partial] Included config ./root.hcl has strategy shallow merge: merging config in (shallow).
11:00:08.166 DEBUG  Found locals block: evaluating the expressions.
11:00:08.166 DEBUG  [modules/test] Found locals block: evaluating the expressions.
11:00:08.166 ERROR  Error: Invalid function argument
11:00:08.166 ERROR    on ./modules/test/module.hcl line 3, in locals:
11:00:08.166 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
11:00:08.166 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
11:00:08.166 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
11:00:08.166 ERROR  this result from an attribute of that resource.
11:00:08.166 DEBUG  [modules/test] Evaluated 1 locals (remaining 0): source
11:00:08.166 DEBUG  [modules/test] Encountered error while evaluating locals in file ./modules/test/module.hcl
11:00:08.166 DEBUG  [modules/test] Found locals block: evaluating the expressions.
11:00:08.167 ERROR  Error: Invalid function argument
11:00:08.167 ERROR    on ./modules/test/module.hcl line 3, in locals:
11:00:08.167 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
11:00:08.167 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
11:00:08.167 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
11:00:08.167 ERROR  this result from an attribute of that resource.
11:00:08.167 DEBUG  [modules/test] Evaluated 1 locals (remaining 0): source
11:00:08.167 DEBUG  [modules/test] Encountered error while evaluating locals in file ./modules/test/module.hcl
11:00:08.167 ERROR  Error: Unsupported attribute
11:00:08.167 ERROR    on ./modules/test/module.hcl line 19:
11:00:08.167 ERROR    19: inputs = local.inputs
11:00:08.167 ERROR  This object does not have an attribute named "inputs".
11:00:08.167 DEBUG  Evaluated 0 locals (remaining 0):
11:00:08.167 DEBUG  Encountered error while evaluating locals in file ./test/terragrunt.hcl
11:00:08.167 ERROR  Error: Attempt to get attribute from null value
11:00:08.167 ERROR    on ./test/terragrunt.hcl line 13:
11:00:08.167 ERROR    13: generate = local.config.generate
11:00:08.167 ERROR  This value is null, so it does not have any attributes.
11:00:08.167 ERROR  Error: Attempt to get attribute from null value
11:00:08.167 ERROR    on ./test/terragrunt.hcl line 14:
11:00:08.167 ERROR    14: inputs   = local.config.inputs
11:00:08.167 ERROR  This value is null, so it does not have any attributes.
11:00:08.167 ERROR  Error: Attempt to get attribute from null value
11:00:08.167 ERROR    on ./test/terragrunt.hcl line 10, in terraform:
11:00:08.167 ERROR    10:   source = local.config.locals.source
11:00:08.167 ERROR  This value is null, so it does not have any attributes.
11:00:08.167 ERROR  Error: Unsuitable value type
11:00:08.167 ERROR    on ./test/terragrunt.hcl line 10, in terraform:
11:00:08.167 ERROR    10:   source = local.config.locals.source
11:00:08.167 ERROR  Unsuitable value: value must be known
11:00:08.167 DEBUG  Did not find any locals block: skipping evaluation.
11:00:08.168 DEBUG  Did not find any locals block: skipping evaluation.
11:00:08.168 DEBUG  Included config ./root.hcl has strategy shallow merge: merging config in (shallow).
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x2 addr=0xb8 pc=0x10204f4d8]

goroutine 29 [running]:
github.com/gruntwork-io/terragrunt/config.(*TerragruntConfig).Merge(0x1400000dc20?, {0x10346a110?, 0x1400000dc20?}, 0x14000f0a2a0?, 0x2?)
	/home/circleci/project/config/include.go:242 +0x28
github.com/gruntwork-io/terragrunt/config.handleInclude(0x14000734e10, {0x10346a110, 0x1400000dc20}, 0x0, 0x0)
	/home/circleci/project/config/include.go:157 +0x358
github.com/gruntwork-io/terragrunt/config.ParseConfig(0x14000396a20, {0x10346a110, 0x1400000dc20}, 0x14000bb2180, 0x0)
	/home/circleci/project/config/config.go:1352 +0x5b4
github.com/gruntwork-io/terragrunt/config.ParseConfigFile.func1({0x10346a5f0?, 0x140003ea37c?})
	/home/circleci/project/config/config.go:1222 +0x378
github.com/gruntwork-io/terragrunt/telemetry.(*Meter).Time(0x1400070fb80?, {0x103441fc8?, 0x14000396a20?}, {0x1025d94b7?, 0x1400070fc88?}, 0x102fea980?, 0x102e09de0?)
	/home/circleci/project/telemetry/meter.go:76 +0x1ac
github.com/gruntwork-io/terragrunt/config.ParseConfigFile.(*Telemeter).Collect.func2({0x103441fc8?, 0x14000396a20?})
	/home/circleci/project/telemetry/telemeter.go:59 +0x40
github.com/gruntwork-io/terragrunt/telemetry.(*Tracer).Trace(0x102fea980?, {0x103441fc8?, 0x14000396a20?}, {0x1025d94b7?, 0x102c28de0?}, 0x20?, 0x14000180008?)
	/home/circleci/project/telemetry/tracer.go:182 +0x120
github.com/gruntwork-io/terragrunt/telemetry.(*Telemeter).Collect(...)
	/home/circleci/project/telemetry/telemeter.go:58
github.com/gruntwork-io/terragrunt/config.ParseConfigFile(0x14000396a20, {0x10346a110, 0x1400000dc20}, {0x14000bbe2c0, 0x32}, 0x0)
	/home/circleci/project/config/config.go:1175 +0x224
github.com/gruntwork-io/terragrunt/internal/discovery.(*DiscoveredConfig).Parse(0x140009f4e10, {0x103441690, 0x14000baa000}, {0x10346a110, 0x1400000dc20}, 0x14000974908, 0x1, {0x0, 0x0, 0x0})
	/home/circleci/project/internal/discovery/discovery.go:480 +0x49c
github.com/gruntwork-io/terragrunt/internal/discovery.(*Discovery).parseWorker(0x14000c1a240, {0x103441690, 0x14000baa000}, {0x10346a110, 0x1400000dc20}, 0x14000974908, 0x1400058e070, 0x1400058e0e0)
	/home/circleci/project/internal/discovery/discovery.go:821 +0xb0
github.com/gruntwork-io/terragrunt/internal/discovery.(*Discovery).parseConcurrently.func2()
	/home/circleci/project/internal/discovery/discovery.go:783 +0x2c
golang.org/x/sync/errgroup.(*Group).Go.func1()
	/home/circleci/go/pkg/mod/golang.org/x/sync@v0.17.0/errgroup/errgroup.go:93 +0x4c
created by golang.org/x/sync/errgroup.(*Group).Go in goroutine 52
	/home/circleci/go/pkg/mod/golang.org/x/sync@v0.17.0/errgroup/errgroup.go:78 +0x90
```


### terragrunt 0.93.3
```
❯ terragrunt version
terragrunt version 0.93.3
❯ terragrunt run --all plan
12:26:57.546 INFO   Using runner pool for stack .
12:26:57.563 ERROR  Error: Invalid function argument
12:26:57.564 ERROR    on ./modules/test/module.hcl line 3, in locals:
12:26:57.564 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
12:26:57.564 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
12:26:57.564 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
12:26:57.564 ERROR  this result from an attribute of that resource.
12:26:57.569 ERROR  Error: Invalid function argument
12:26:57.569 ERROR    on ./modules/test/module.hcl line 3, in locals:
12:26:57.570 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
12:26:57.570 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
12:26:57.570 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
12:26:57.570 ERROR  this result from an attribute of that resource.
12:26:57.570 ERROR  Error: Unsupported attribute
12:26:57.570 ERROR    on ./modules/test/module.hcl line 19:
12:26:57.570 ERROR    19: inputs = local.inputs
12:26:57.570 ERROR  This object does not have an attribute named "inputs".
12:26:57.570 ERROR  Error: Unsuitable value type
12:26:57.570 ERROR    on ./test/terragrunt.hcl line 10, in terraform:
12:26:57.570 ERROR    10:   source = local.config.locals.source
12:26:57.570 ERROR  Unsuitable value: value must be known
12:26:57.583 ERROR  Error: Invalid function argument
12:26:57.583 ERROR    on ./modules/test/module.hcl line 3, in locals:
12:26:57.583 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
12:26:57.583 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
12:26:57.583 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
12:26:57.583 ERROR  this result from an attribute of that resource.
12:26:57.583 ERROR  Error: Invalid function argument
12:26:57.583 ERROR    on ./modules/test/module.hcl line 3, in locals:
12:26:57.583 ERROR     3:   inputs = yamldecode(file("${get_original_terragrunt_dir()}/inputs.yaml"))
12:26:57.584 ERROR  Invalid value for "path" parameter: no file exists at ./inputs.yaml; this function works only with files that are
12:26:57.584 ERROR  distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain
12:26:57.584 ERROR  this result from an attribute of that resource.
12:26:57.584 ERROR  Error: Unsupported attribute
12:26:57.584 ERROR    on ./modules/test/module.hcl line 19:
12:26:57.584 ERROR    19: inputs = local.inputs
12:26:57.584 ERROR  This object does not have an attribute named "inputs".
12:26:57.584 ERROR  Error: Unsuitable value type
12:26:57.584 ERROR    on ./test/terragrunt.hcl line 10, in terraform:
12:26:57.584 ERROR    10:   source = local.config.locals.source
12:26:57.584 ERROR  Unsuitable value: value must be known
12:26:57.584 WARN   Parsing errors where encountered while discovering dependencies. They were suppressed, and can be found in the debug logs.
12:26:57.584 ERROR  ./test/terragrunt.hcl:10,12-38: Unsuitable value type; Unsuitable value: value must be known
12:26:57.585 ERROR  Unable to determine underlying exit code, so Terragrunt will exit with error code 1
```
