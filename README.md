This is an example project that has a plan for testing builds. It is primarily concerned with being an example of building plans in Chef Delivery using the `habitat-build` cookbook.

# Build Cookbook

This repository uses the [habitat-build](https://github.com/habitat-sh/habitat-build-cookbook) cookbook. This is a private repository on GitHub now, but it will be public (but not on Supermarket) when Habitat launches.

To use the build cookbook in your own Habitat project, follow these steps.

[Initialize the project for Chef Delivery](https://docs.chef.io/release/delivery/delivery_pipeline.html) with `delivery init`. This should create a build cookbook using the [pcb](http://github.com/chef-cookbooks/pcb) cookbook generator.

Add the following to the `.delivery/build-cookbook/Berksfile`'s `:delivery` group. This will ensure that the cookbook is downloaded on the Delivery build nodes during each phase.

```
cookbook 'habitat-build', git: 'git@github.com:habitat-sh/habitat-build-cookbook'
```

Also add a dependency to `.delivery/build-cookbook/metadata.rb`.

```
depends 'habitat-build'
```

In each recipe in `.delivery/build-cookbook/recipes`, add an `include_recipe` for the `habitat-build` cookbook. For example in `.delivery/build-cookbook/recipes/default.rb`:

```
include_recipe "habitat-build::default"
```

A short shell `for` loop can accomplish this.

```
cd .delivery/buld-cookbook/recipes

for i in *
do
  echo "include_recipe 'habitat-build::$(basename $i .rb)'" >> $i
done
```

Commit the changes and submit the changeset to Delivery.

```
git add .
git commit -m 'Add build cookbook for Delivery'
delivery review
```
