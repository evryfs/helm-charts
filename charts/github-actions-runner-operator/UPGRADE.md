## from 0.x to 1.x

The chart adds a `name` label to the deployments podtemplate/selector, these labels are immutable - so you need to do an uninstall/install cycle (`--force` does not seem to work for this).
