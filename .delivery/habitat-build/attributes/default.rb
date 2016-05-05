# By default we use the public Habitat Depot
default['habitat-build']['depot-url'] = 'http://willem.habitat.sh:9632'

# TODO: (jtimberman) Maybe we can discover these at some point, but it
# really doesn't matter - these are in the depot now, and will be
# available forevermore. Until they're not. And then we'll update
# these attributes.
default['habitat-build']['hab-pkgident'] = 'core/hab/0.4.0/20160503202801'
default['habitat-build']['hab-bpm-pkgident'] = 'core/hab-bpm/0.1.0/20160427212821'
default['habitat-build']['hab-studio-pkgident'] = 'core/hab-studio/0.1.0/20160428032717'
