package Dist::Zilla::PluginBundle::Author::HAYOBAAN;
use strict;
use warnings;

# ABSTRACT: Hayo Baan's Dist::Zilla configuration
our $VERSION = '0.002'; # VERSION

#pod =for test_synopsis
#pod my @HAYOBAAN;
#pod
#pod =head1 DESCRIPTION
#pod
#pod This is a L<Dist::Zilla> PluginBundle. It installs and configures
#pod L<Dist::Zilla> plugins according to HAYOBAAN's preferences. The
#pod following plugins are (conditionally) installed and configured:
#pod
#pod   Dist::Zilla::Plugin::AutoVersion
#pod   Dist::Zilla::Plugin::Git::NextVersion
#pod   Dist::Zilla::Plugin::OurPkgVersion
#pod   Dist::Zilla::Plugin::GatherDir
#pod   Dist::Zilla::Plugin::Git::GatherDir
#pod   Dist::Zilla::Plugin::PruneCruft
#pod   Dist::Zilla::Plugin::ManifestSkip
#pod   Dist::Zilla::Plugin::PodWeaver
#pod   Dist::Zilla::Plugin::ReadmeAnyFromPod / Text
#pod   Dist::Zilla::Plugin::ReadmeAnyFromPod / Markdown
#pod   Dist::Zilla::Plugin::License
#pod   Dist::Zilla::Plugin::InstallGuide
#pod   Dist::Zilla::Plugin::MinimumPerl
#pod   Dist::Zilla::Plugin::AutoPrereqs
#pod   Dist::Zilla::Plugin::MetaNoIndex
#pod   Dist::Zilla::Plugin::GitHub::Meta
#pod   Dist::Zilla::Plugin::MetaJSON
#pod   Dist::Zilla::Plugin::MetaYAML
#pod   Dist::Zilla::Plugin::MetaProvides::Package
#pod   Dist::Zilla::Plugin::MetaProvides::Class
#pod   Dist::Zilla::Plugin::ExecDir
#pod   Dist::Zilla::Plugin::ShareDir
#pod   Dist::Zilla::Plugin::MakeMaker
#pod   Dist::Zilla::Plugin::ModuleBuild
#pod   Dist::Zilla::Plugin::Manifest
#pod   Dist::Zilla::Plugin::CopyFilesFromBuild
#pod   Dist::Zilla::Plugin::Run::AfterBuild
#pod   Dist::Zilla::Plugin::CheckChangesHasContent
#pod   Dist::Zilla::Plugin::Git::CheckFor::CorrectBranch
#pod   Dist::Zilla::Plugin::Git::Check
#pod   Dist::Zilla::Plugin::CheckMetaResources
#pod   Dist::Zilla::Plugin::CheckPrereqsIndexed
#pod   Dist::Zilla::Plugin::Test::Compile
#pod   Dist::Zilla::Plugin::Test::Perl::Critic
#pod   Dist::Zilla::Plugin::Test::EOL
#pod   Dist::Zilla::Plugin::Test::NoTabs
#pod   Dist::Zilla::Plugin::Test::Version
#pod   Dist::Zilla::Plugin::Test::MinimumVersion
#pod   Dist::Zilla::Plugin::MojibakeTests
#pod   Dist::Zilla::Plugin::Test::Kwalitee
#pod   Dist::Zilla::Plugin::Test::Portability
#pod   Dist::Zilla::Plugin::Test::UnusedVars
#pod   Dist::Zilla::Plugin::Test::CPAN::Changes
#pod   Dist::Zilla::Plugin::Test::DistManifest
#pod   Dist::Zilla::Plugin::Test::CPAN::Meta::JSON
#pod   Dist::Zilla::Plugin::MetaTests
#pod   Dist::Zilla::Plugin::PodSyntaxTests
#pod   Dist::Zilla::Plugin::PodCoverageTests
#pod   Dist::Zilla::Plugin::Test::Pod::LinkCheck
#pod   Dist::Zilla::Plugin::Test::Synopsis
#pod   Dist::Zilla::Plugin::TestRelease
#pod   Dist::Zilla::Plugin::RunExtraTests
#pod   Dist::Zilla::Plugin::ConfirmRelease
#pod   Dist::Zilla::Plugin::UploadToCPAN
#pod   Dist::Zilla::Plugin::SchwartzRatio
#pod   Dist::Zilla::Plugin::FakeRelease
#pod   Dist::Zilla::Plugin::NextRelease
#pod   Dist::Zilla::Plugin::Git::Commit
#pod   Dist::Zilla::Plugin::Git::Tag
#pod   Dist::Zilla::Plugin::Git::Push
#pod   Dist::Zilla::Plugin::GitHub::Update
#pod   Dist::Zilla::Plugin::Run::AfterRelease
#pod   Dist::Zilla::Plugin::Clean
#pod
#pod =head1 USAGE
#pod
#pod   # In dist.ini
#pod   [@Author::HAYOBAAN]
#pod
#pod =head1 OPTIONS
#pod
#pod The following additional command-line option is available for the C<dzil> command.
#pod
#pod =head2 C<--local>, C<local_only>, C<local_release>, or C<--local_release_only>
#pod
#pod Adding this option to the C<dzil release> command will:
#pod
#pod =for :list
#pod * inhibit uploading to CPAN (if applicable),
#pod * inhibit git checking, tagging, commiting, and pushing,
#pod * inhibit Changes file checking
#pod * keep the version number the same.
#pod
#pod The C<run_after_release> code is still run so you can use this flag to
#pod "release" a development version locally for further use or testing,
#pod without e.g., increasing the version number.
#pod
#pod =head1 STABILITY
#pod
#pod This module is still under development.
#pod
#pod =head1 CREDITS
#pod
#pod I took inspiration from many people's L<Dist::Zilla> and L<Pod::Weaver> PluginBundles. Most notably from:
#pod
#pod =for :list
#pod * David Golden L<DAGOLDEN|https://metacpan.org/pod/Dist::Zilla::PluginBundle::DAGOLDEN>
#pod * Mike Dohorty L<DOHORTY|https://metacpan.org/pod/Dist::Zilla::PluginBundle::Author::DOHORTY>
#pod
#pod =cut

use Getopt::Long;

use Moose 0.99;
use namespace::autoclean 0.09;
use Dist::Zilla 5.014; # default_jobs
with 'Dist::Zilla::Role::PluginBundle::Easy';

# Required non-core Dist::Zilla plugins:
use Dist::Zilla::Plugin::Git::NextVersion ();
use Dist::Zilla::Plugin::OurPkgVersion ();
use Dist::Zilla::Plugin::Git::GatherDir ();
use Dist::Zilla::Plugin::PodWeaver ();
use Dist::Zilla::Plugin::ReadmeAnyFromPod ();
use Dist::Zilla::Plugin::InstallGuide ();
use Dist::Zilla::Plugin::MinimumPerl ();
use Dist::Zilla::Plugin::GitHub::Meta ();
use Dist::Zilla::Plugin::MetaProvides ();
use Dist::Zilla::Plugin::CopyFilesFromBuild ();
use Dist::Zilla::Plugin::Run ();
use Dist::Zilla::Plugin::CheckChangesHasContent ();
use Dist::Zilla::Plugin::Git::CheckFor::CorrectBranch ();
use Dist::Zilla::Plugin::Git::Check ();
use Dist::Zilla::Plugin::CheckMetaResources ();
use Dist::Zilla::Plugin::CheckPrereqsIndexed ();
use Dist::Zilla::Plugin::Test::Compile ();
use Dist::Zilla::Plugin::Test::Perl::Critic ();
use Dist::Zilla::Plugin::Test::EOL ();
use Dist::Zilla::Plugin::Test::NoTabs ();
use Dist::Zilla::Plugin::Test::Version ();
use Dist::Zilla::Plugin::Test::MinimumVersion ();
use Dist::Zilla::Plugin::MojibakeTests ();
use Dist::Zilla::Plugin::Test::Kwalitee ();
use Dist::Zilla::Plugin::Test::Portability ();
use Dist::Zilla::Plugin::Test::UnusedVars ();
use Dist::Zilla::Plugin::Test::CPAN::Changes ();
use Dist::Zilla::Plugin::Test::DistManifest ();
use Dist::Zilla::Plugin::Test::CPAN::Meta::JSON ();
use Dist::Zilla::Plugin::Test::Pod::LinkCheck ();
use Dist::Zilla::Plugin::Test::Synopsis ();
use Dist::Zilla::Plugin::RunExtraTests ();
use Dist::Zilla::Plugin::SchwartzRatio ();
use Dist::Zilla::Plugin::Git::Commit ();
use Dist::Zilla::Plugin::Git::Tag ();
use Dist::Zilla::Plugin::Git::Push ();
use Dist::Zilla::Plugin::GitHub::Update ();
use Dist::Zilla::Plugin::Clean ();

sub mvp_multivalue_args { qw(git_remote run_after_build run_after_release additional_test disable_test) }

sub mvp_aliases {
    {
        local         => "local_release_only",
        local_only    => "local_release_only",
        local_release => "local_release_only",
    }
}

#pod =for Pod::Coverage mvp_multivalue_args mvp_aliases
#pod
#pod =attr is_cpan
#pod
#pod Specifies that this is a distribution that is destined for CPAN. When
#pod true, releases are uploaded to CPAN using
#pod L<UploadToCPAN|Dist::Zilla::Plugin::UploadToCPAN>. If false, releases
#pod are made using L<FakeRelease|Dist::Zilla::Plugin::FakeRelease>.
#pod
#pod Default: I<false>.
#pod
#pod =cut

has is_cpan => (
    is      => 'ro',
    isa     => 'Bool',
    lazy    => 1,
    default => sub { $_[0]->payload->{is_cpan} },
);

#pod =attr is_github_hosted
#pod
#pod Specifies that the distribution's repository is hosted on GitHub.
#pod
#pod Default: I<false> (note: setting C<is_cpan> enforces C<is_github_hosted>
#pod to I<true>)
#pod
#pod =cut

has is_github_hosted => (
    is      => 'ro',
    isa     => 'Bool',
    lazy    => 1,
    default => sub { $_[0]->payload->{is_github} || $_[0]->is_cpan },
);

#pod =attr git_remote
#pod
#pod Specifies where to push the distribution on GitHub. Can be used
#pod multiple times to upload to multiple branches.
#pod
#pod Default: C<origin>
#pod
#pod =cut

has git_remote => (
    is      => 'ro',
    isa     => 'ArrayRef',
    lazy    => 1,
    default => sub { $_[0]->payload->{git_remote} // [ 'origin' ] },
);

#pod =attr no_git
#pod
#pod Specifies that the distribution is not under git version control.
#pod
#pod Default: I<false> (note: setting C<is_github_hosted> enforces this
#pod setting to I<false>)
#pod
#pod =cut

has no_git => (
    is      => 'ro',
    isa     => 'Bool',
    lazy    => 1,
    default => sub { $_[0]->payload->{no_git} && !$_[0]->is_github_hosted },
);

#pod =attr local_release_only
#pod
#pod Setting this to I<true> will:
#pod
#pod =for :list
#pod * inhibit uploading to CPAN (if applicable),
#pod * inhibit git checking, tagging, commiting, and pushing,
#pod * keep the version number the same,
#pod
#pod when I<releasing> the distribution.
#pod
#pod =cut

has local_release_only => (
    is      => 'rw',
    isa     => 'Bool',
    lazy    => 1,
    default => sub { $_[0]->payload->{local_release_only} }
);

#pod =attr run_after_build
#pod
#pod Specifies commands to run after the release has been built (but not yet released). Multiple
#pod C<run_after_build> commands can be specified.
#pod
#pod The commands are run from the root of your development tree and has the following special symbols available:
#pod
#pod =for :list
#pod * C<%d> the directory in which the distribution was built
#pod * C<%n> the name of the distribution
#pod * C<%p> path separator ('/' on Unix, '\\' on Win32... useful for cross-platform dist.ini files)
#pod * C<%v> the version of the distribution
#pod * C<%t> -TRIAL if the release is a trial release, otherwise the empty string
#pod * C<%x> full path to the current perl interpreter (like $^X but from Config)
#pod
#pod Default: I<nothing>
#pod
#pod =cut

has run_after_build => (
    is      => 'ro',
    isa     => 'ArrayRef',
    lazy    => 1,
    default => sub { $_[0]->payload->{run_after_build} // [] },
);

#pod =attr run_after_release
#pod
#pod Specifies commands to run after the release has been made. Use it to e.g.,
#pod automatically install your distibution after releasing. Multiple
#pod run_after_release commands can be specified.
#pod
#pod The commands are run from the root of your development tree and has
#pod the same symbols available as the C<run_after_build>, plus the
#pod following:
#pod
#pod =for :list
#pod * C<%a> the archive of the release
#pod
#pod Default: C<cpanm './%d'>
#pod
#pod =head3 Examples:
#pod
#pod To install using cpanm (this is the default):
#pod
#pod   run_after_release = cpanm './%d'
#pod
#pod To install using cpan:
#pod
#pod   run_after_release = %x -MCPAN -einstall './%d'
#pod
#pod To not do anything:
#pod
#pod   run_after_release =
#pod
#pod =cut

has run_after_release => (
    is      => 'ro',
    isa     => 'ArrayRef',
    lazy    => 1,
    default => sub { exists $_[0]->payload->{run_after_release} ? $_[0]->payload->{run_after_release} : [ 'cpanm ./%d' ] },
);

#pod =attr additional_test
#pod
#pod Additional test plugin to use. Can be used multiple times to add more
#pod than one additional test.
#pod
#pod By default the following tests are executed:
#pod
#pod =for :list
#pod * C<Test::Compile> -- Checks if perl code compiles correctly
#pod * C<Test::Perl::Critic> -- Checks Perl source code for best-practices
#pod * C<Test::EOL> -- Checks line endings
#pod * C<Test::NoTabs> -- Checks for the use of tabs
#pod * C<Test::Version> -- Checks to see if each module has the correct version set
#pod * C<Test::MinimumVersion> -- Checks the minimum perl version, using C<max_target_perl>
#pod * C<MojibakeTests> -- Checks source encoding
#pod * C<Test::Kwalitee> -- Checks the Kwalitee
#pod * C<Test::Portability> -- Checks portability of code
#pod * C<Test::UnusedVars> -- Checks for unused variables
#pod * C<Test::CPAN::Changes> -- Validation of the Changes file
#pod * C<Test::DistManifest> -- Validation of the MANIFEST file
#pod * C<Test::CPAN::Meta::JSON> -- Validation of the META.json file -- only when hosted on GitHub
#pod * C<MetaTests> -- Validation of the META.yml file -- only when hosted on GitHub
#pod * C<PodSyntaxTests> -- Checks pod syntax
#pod * C<PodCoverageTests> -- Checks pod coverage
#pod * C<Test::Pod::LinkCheck> -- Checks pod links
#pod * C<Test::Synopsis> -- Checks the pod synopsis
#pod
#pod =cut

has additional_test => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    lazy    => 1,
    default => sub { $_[0]->payload->{additional_test} // [] },
);

#pod =attr disable_test
#pod
#pod Specifies the test you don't want to be run. Can bu used more than
#pod once to disable multiple tests.
#pod
#pod Default: I<none> (i.e., run all default and C<additional_test> tests).
#pod
#pod =cut

has disable_test => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    lazy    => 1,
    default => sub { $_[0]->payload->{disable_test} // [] },
);

#pod =attr max_target_perl
#pod
#pod Defines the highest minimum version of perl you intend to require.
#pod This is passed to L<Dist::Zilla::Plugin::Test::MinimumVersion>, which generates
#pod a F<minimum-version.t> test that'll warn you if you accidentally used features
#pod from a higher version of perl than you wanted. (Having a lower required version
#pod of perl is okay.)
#pod
#pod Default: C<5.10>
#pod
#pod =cut

has max_target_perl => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->payload->{max_target_perl} // '5.10.' },
);

#pod =attr weaver_config
#pod
#pod Specifies the configuration for L<Pod::Weaver>.
#pod
#pod Default: C<@Author::HAYOBAAN>.
#pod
#pod =cut

has weaver_config => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->payload->{weaver_config} // '@Author::HAYOBAAN' },
);

#pod =attr tag_format
#pod
#pod Specifies the format for tagging a release (see
#pod L<Git::Tag|Dist::Zilla::Plugin::Git::Tag> for details).
#pod
#pod Default: C<v%v%t>
#pod
#pod =cut

has tag_format => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->payload->{tag_format} // 'v%v%t' },
);

#pod =attr version_regexp
#pod
#pod Specifies the regexp for versions (see
#pod L<Git::NextVersion|Dist::Zilla::Plugin::Git::NextVersion> for details).
#pod
#pod Default: C<^v?([\d.]+)(?:-TRIAL)?$>
#pod
#pod Note: only used in case of git version controlled repositories
#pod (L<AutoVersion|Dist::Zilla::Plugin::AutoVersion> is used in case of
#pod non-git version controlled repositories).
#pod
#pod =cut

has version_regexp => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->payload->{version_regexp} // '^v?([\d.]+)(?:-TRIAL)?$' },
);

################################################################################

# List of files to copy to the root after they were built.
has copy_build_files => (
    is  => 'ro',
    isa => 'ArrayRef[Str]',
    lazy => 1,
    default => sub { [ qw(Build.PL Makefile.PL README README.mkdn) ] },
);

# Files to exclude from gatherer
has exclude_files => (
    is  => 'ro',
    isa => 'ArrayRef[Str]',
    lazy => 1,
    default => sub { [
        @{$_[0]->copy_build_files},
        qw(MANIFEST),
    ] },
);

# Files that can be "dirty"
has allow_dirty => (
    is  => 'ro',
    isa => 'ArrayRef[Str]',
    lazy => 1,
    default => sub { [
        @{$_[0]->copy_build_files},
        qw(dist.ini Changes),
    ] },
);

# Directories that should not be indexed
has meta_no_index_dirs => (
    is  => 'ro',
    isa => 'ArrayRef[Str]',
    lazy => 1,
    default => sub { [ qw(corpus) ] },
);

# Helper function to add a test, checks for disabled tests
sub _add_test {
    my $self = shift;
    map {
        my $plugin = ref $_ ? $_->[0] : $_;
        grep /^$plugin$/, @{$self->disable_test} ? () : $_;
    } @_;
}

#pod =for Pod::Coverage configure
#pod
#pod =cut

sub configure {
    my $self = shift;

    {
        my $local;
        GetOptions('local|local_only|local_release|local-release-only!' => \$local);
        $self->local_release_only($local) if defined $local;
    }

    $self->add_plugins(
        #### Version ####
        $self->no_git ? (
            # Provide automatic version based on date
            'AutoVersion'
        ) : (
            # Provide a version number by bumping the last git release tag
            [
                'Git::NextVersion' => {
                    first_version     => 0.001,                 # First version = 0.001
                    version_by_branch => 0,                     # Set to 1 if doing maintenance branch
                    version_regexp    => $self->version_regexp, # Regexp for version format
                },
            ],
        ),

        # Adds version to file (no line insertion, using our)
        'OurPkgVersion',

        #### Gather & Prune ####
        # Gather files to include
        [ $self->no_git ? 'GatherDir' : 'Git::GatherDir' => { exclude_filename => $self->exclude_files } ],
        # Remove cruft
        'PruneCruft',
        # Skip files in MANIFEST.SKIP
        'ManifestSkip',

        #### PodWeaver ####
        # Automatically extends POD
        [
            'PodWeaver' => {
                config_plugin      => '@Author::HAYOBAAN',
                replacer           => 'replace_with_comment',
                post_code_replacer => 'replace_with_nothing',
            }
        ],

        #### Distribution Files & Metadata ####
        # Create README and README.mkdn from POD
        [ 'ReadmeAnyFromPod', 'Text' ],
        [ 'ReadmeAnyFromPod', 'Markdown' ],

        $self->is_github_hosted ? (
            # Create a LICENSE file
            'License',
            # Create an INSTALL file
            'InstallGuide',
        ) : (),

        # Automatically determine minimum perl version
        'MinimumPerl',
        # Automatically determine prerequisites
        'AutoPrereqs',

        # Do not index certain dirs",
        [ 'MetaNoIndex' => { dir => $self->meta_no_index_dirs } ],

        $self->is_github_hosted ? (
            # Add GitHub metadata",
            'GitHub::Meta',
            # Add META.json",
            'MetaJSON',
            # Add META.yaml",
            'MetaYAML',
            # Add provided Packages to META.*",
            'MetaProvides::Package',
            # Add provided Classes to META.*",
            'MetaProvides::Class',
        ) : (),

        #### Build System ####
        # Install content of bin directory as executables
        'ExecDir',
        # Install content of share directory as sharedir
        'ShareDir',
        # Build a Makefile.PL that uses ExtUtils::MakeMaker
        [ 'MakeMaker', { default_jobs => 9 } ],
        # Build a Build.PL that uses Module::Build
        'ModuleBuild',

        # Add Manifest
        'Manifest',

        #### After Build ####
        # Copy/move specific files after building them
        [ 'CopyFilesFromBuild' => { copy => $self->copy_build_files } ],

        @{$self->run_after_build} ? (
            # Run specified commands
            [ 'Run::AfterBuild' => { run => $self->run_after_build } ],
        ) : (),

        #### Before Release Tests ####
        !$self->local_release_only ? (
            # Check if Changes file has content
            'CheckChangesHasContent',
        ) : (),

        !$self->no_git && !$self->local_release_only ? (
            # Check if we're on the correct git branch
            'Git::CheckFor::CorrectBranch',
            # Check git repository for uncommitted files before releasing
            [ 'Git::Check' => { allow_dirty => $self->allow_dirty } ],
            $self->is_cpan ? (
                # Check resources section of meta files
                'CheckMetaResources',
                # Check if prereqs are available on CPAN
                'CheckPrereqsIndexed',
            ) : (),
        ) : (),

        # Extra test (gatherdir)
        # Checks if perl code compiles correctly
        $self->_add_test('Test::Compile'),

        # Extra tests (author)
        # Checks Perl source code for best-practices
        $self->_add_test('Test::Perl::Critic'),
        # Checks line endings
        $self->_add_test('Test::EOL'),
        # Checks for the use of tabs
        $self->_add_test('Test::NoTabs'),

        # Extra tests (release)
        # Checks to see if each module has the correct version set
        $self->_add_test('Test::Version'),
        # Checks the minimum perl version
        $self->_add_test([ 'Test::MinimumVersion' => { max_target_perl => $self->max_target_perl } ]),
        # Checks source encoding
        $self->_add_test('MojibakeTests'),
        # Checks the Kwalitee
        $self->_add_test('Test::Kwalitee'),
        # Checks portability of code
        $self->_add_test('Test::Portability'),
        # Checks for unused variables
        $self->_add_test('Test::UnusedVars'),
        !$self->local_release_only ? (
            # Validation of the Changes file
            $self->_add_test('Test::CPAN::Changes'),
        ) : (),
        # Validation of the MANIFEST file
        $self->_add_test('Test::DistManifest'),

        $self->is_github_hosted ? (
            # Validation of the META.json file
            $self->_add_test('Test::CPAN::Meta::JSON'),
            # Validation of the META.yml file
            $self->_add_test('MetaTests'),
        ) : (),

        # Checks pod syntax
        $self->_add_test('PodSyntaxTests'),
        # Checks pod coverage
        $self->_add_test('PodCoverageTests'),
        # Checks pod links
        $self->_add_test('Test::Pod::LinkCheck'),
        # Checks the pod synopsis
        $self->_add_test('Test::Synopsis'),

        # Add the additional tests specified
        @{$self->additional_test} ? $self->_add_test(@{$self->additional_test}) : (),

        #### Run tests ####
        # Run provided tests in /t directory before releasing
        'TestRelease',
        # Run the extra tests
        [ 'RunExtraTests' => { default_jobs => 9 } ],

        #### Release ####
        !$self->local_release_only ? (
            # Prompt for confirmation before releasing
            'ConfirmRelease',
        ) : (),
        $self->is_cpan && !$self->local_release_only ? (
            # Upload release to CPAN,
            'UploadToCPAN',
            # Provide statistics
            'SchwartzRatio',
        ) : (
            # Fake release
            'FakeRelease',
        ),

        #### After release ###
        !$self->local_release_only ? (
            # Update the next release number in the changelog
            [ 'NextRelease' => { format => '%-9v %{yyyy-MM-dd}d' } ],
        ) : (),

        !$self->no_git && !$self->local_release_only ? (
            # Commit dirty files
            [ 'Git::Commit' => { allow_dirty => $self->allow_dirty } ],
            # Tag the new version
            [
                'Git::Tag' => {
                    tag_format  => $self->tag_format,
                    tag_message => 'Released ' . $self->tag_format,
                }
            ],
        ) : (),

        $self->is_github_hosted && @{$self->git_remote} && !$self->local_release_only ? (
            # Push current branch
            [ 'Git::Push', { push_to => $self->git_remote } ],
        ) : (),

        $self->is_cpan && !$self->local_release_only ? (
            # Update GitHub repository info on release
            [ 'GitHub::Update' => { metacpan => 1 } ]
        ) : (),

        @{$self->run_after_release} ? (
            # Install the release
            [ 'Run::AfterRelease' => { run => $self->run_after_release } ],
        ) : (),

        # Cleanup
        'Clean',
    );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::PluginBundle::Author::HAYOBAAN - Hayo Baan's Dist::Zilla configuration

=head1 VERSION

version 0.002

=head1 DESCRIPTION

This is a L<Dist::Zilla> PluginBundle. It installs and configures
L<Dist::Zilla> plugins according to HAYOBAAN's preferences. The
following plugins are (conditionally) installed and configured:

  Dist::Zilla::Plugin::AutoVersion
  Dist::Zilla::Plugin::Git::NextVersion
  Dist::Zilla::Plugin::OurPkgVersion
  Dist::Zilla::Plugin::GatherDir
  Dist::Zilla::Plugin::Git::GatherDir
  Dist::Zilla::Plugin::PruneCruft
  Dist::Zilla::Plugin::ManifestSkip
  Dist::Zilla::Plugin::PodWeaver
  Dist::Zilla::Plugin::ReadmeAnyFromPod / Text
  Dist::Zilla::Plugin::ReadmeAnyFromPod / Markdown
  Dist::Zilla::Plugin::License
  Dist::Zilla::Plugin::InstallGuide
  Dist::Zilla::Plugin::MinimumPerl
  Dist::Zilla::Plugin::AutoPrereqs
  Dist::Zilla::Plugin::MetaNoIndex
  Dist::Zilla::Plugin::GitHub::Meta
  Dist::Zilla::Plugin::MetaJSON
  Dist::Zilla::Plugin::MetaYAML
  Dist::Zilla::Plugin::MetaProvides::Package
  Dist::Zilla::Plugin::MetaProvides::Class
  Dist::Zilla::Plugin::ExecDir
  Dist::Zilla::Plugin::ShareDir
  Dist::Zilla::Plugin::MakeMaker
  Dist::Zilla::Plugin::ModuleBuild
  Dist::Zilla::Plugin::Manifest
  Dist::Zilla::Plugin::CopyFilesFromBuild
  Dist::Zilla::Plugin::Run::AfterBuild
  Dist::Zilla::Plugin::CheckChangesHasContent
  Dist::Zilla::Plugin::Git::CheckFor::CorrectBranch
  Dist::Zilla::Plugin::Git::Check
  Dist::Zilla::Plugin::CheckMetaResources
  Dist::Zilla::Plugin::CheckPrereqsIndexed
  Dist::Zilla::Plugin::Test::Compile
  Dist::Zilla::Plugin::Test::Perl::Critic
  Dist::Zilla::Plugin::Test::EOL
  Dist::Zilla::Plugin::Test::NoTabs
  Dist::Zilla::Plugin::Test::Version
  Dist::Zilla::Plugin::Test::MinimumVersion
  Dist::Zilla::Plugin::MojibakeTests
  Dist::Zilla::Plugin::Test::Kwalitee
  Dist::Zilla::Plugin::Test::Portability
  Dist::Zilla::Plugin::Test::UnusedVars
  Dist::Zilla::Plugin::Test::CPAN::Changes
  Dist::Zilla::Plugin::Test::DistManifest
  Dist::Zilla::Plugin::Test::CPAN::Meta::JSON
  Dist::Zilla::Plugin::MetaTests
  Dist::Zilla::Plugin::PodSyntaxTests
  Dist::Zilla::Plugin::PodCoverageTests
  Dist::Zilla::Plugin::Test::Pod::LinkCheck
  Dist::Zilla::Plugin::Test::Synopsis
  Dist::Zilla::Plugin::TestRelease
  Dist::Zilla::Plugin::RunExtraTests
  Dist::Zilla::Plugin::ConfirmRelease
  Dist::Zilla::Plugin::UploadToCPAN
  Dist::Zilla::Plugin::SchwartzRatio
  Dist::Zilla::Plugin::FakeRelease
  Dist::Zilla::Plugin::NextRelease
  Dist::Zilla::Plugin::Git::Commit
  Dist::Zilla::Plugin::Git::Tag
  Dist::Zilla::Plugin::Git::Push
  Dist::Zilla::Plugin::GitHub::Update
  Dist::Zilla::Plugin::Run::AfterRelease
  Dist::Zilla::Plugin::Clean

=head1 USAGE

  # In dist.ini
  [@Author::HAYOBAAN]

=head1 OPTIONS

The following additional command-line option is available for the C<dzil> command.

=head2 C<--local>, C<local_only>, C<local_release>, or C<--local_release_only>

Adding this option to the C<dzil release> command will:

=over 4

=item *

inhibit uploading to CPAN (if applicable),

=item *

inhibit git checking, tagging, commiting, and pushing,

=item *

inhibit Changes file checking

=item *

keep the version number the same.

=back

The C<run_after_release> code is still run so you can use this flag to
"release" a development version locally for further use or testing,
without e.g., increasing the version number.

=head1 ATTRIBUTES

=head2 is_cpan

Specifies that this is a distribution that is destined for CPAN. When
true, releases are uploaded to CPAN using
L<UploadToCPAN|Dist::Zilla::Plugin::UploadToCPAN>. If false, releases
are made using L<FakeRelease|Dist::Zilla::Plugin::FakeRelease>.

Default: I<false>.

=head2 is_github_hosted

Specifies that the distribution's repository is hosted on GitHub.

Default: I<false> (note: setting C<is_cpan> enforces C<is_github_hosted>
to I<true>)

=head2 git_remote

Specifies where to push the distribution on GitHub. Can be used
multiple times to upload to multiple branches.

Default: C<origin>

=head2 no_git

Specifies that the distribution is not under git version control.

Default: I<false> (note: setting C<is_github_hosted> enforces this
setting to I<false>)

=head2 local_release_only

Setting this to I<true> will:

=over 4

=item *

inhibit uploading to CPAN (if applicable),

=item *

inhibit git checking, tagging, commiting, and pushing,

=item *

keep the version number the same,

=back

when I<releasing> the distribution.

=head2 run_after_build

Specifies commands to run after the release has been built (but not yet released). Multiple
C<run_after_build> commands can be specified.

The commands are run from the root of your development tree and has the following special symbols available:

=over 4

=item *

C<%d> the directory in which the distribution was built

=item *

C<%n> the name of the distribution

=item *

C<%p> path separator ('/' on Unix, '\\' on Win32... useful for cross-platform dist.ini files)

=item *

C<%v> the version of the distribution

=item *

C<%t> -TRIAL if the release is a trial release, otherwise the empty string

=item *

C<%x> full path to the current perl interpreter (like $^X but from Config)

=back

Default: I<nothing>

=head2 run_after_release

Specifies commands to run after the release has been made. Use it to e.g.,
automatically install your distibution after releasing. Multiple
run_after_release commands can be specified.

The commands are run from the root of your development tree and has
the same symbols available as the C<run_after_build>, plus the
following:

=over 4

=item *

C<%a> the archive of the release

=back

Default: C<cpanm './%d'>

=head3 Examples:

To install using cpanm (this is the default):

  run_after_release = cpanm './%d'

To install using cpan:

  run_after_release = %x -MCPAN -einstall './%d'

To not do anything:

  run_after_release =

=head2 additional_test

Additional test plugin to use. Can be used multiple times to add more
than one additional test.

By default the following tests are executed:

=over 4

=item *

C<Test::Compile> -- Checks if perl code compiles correctly

=item *

C<Test::Perl::Critic> -- Checks Perl source code for best-practices

=item *

C<Test::EOL> -- Checks line endings

=item *

C<Test::NoTabs> -- Checks for the use of tabs

=item *

C<Test::Version> -- Checks to see if each module has the correct version set

=item *

C<Test::MinimumVersion> -- Checks the minimum perl version, using C<max_target_perl>

=item *

C<MojibakeTests> -- Checks source encoding

=item *

C<Test::Kwalitee> -- Checks the Kwalitee

=item *

C<Test::Portability> -- Checks portability of code

=item *

C<Test::UnusedVars> -- Checks for unused variables

=item *

C<Test::CPAN::Changes> -- Validation of the Changes file

=item *

C<Test::DistManifest> -- Validation of the MANIFEST file

=item *

C<Test::CPAN::Meta::JSON> -- Validation of the META.json file -- only when hosted on GitHub

=item *

C<MetaTests> -- Validation of the META.yml file -- only when hosted on GitHub

=item *

C<PodSyntaxTests> -- Checks pod syntax

=item *

C<PodCoverageTests> -- Checks pod coverage

=item *

C<Test::Pod::LinkCheck> -- Checks pod links

=item *

C<Test::Synopsis> -- Checks the pod synopsis

=back

=head2 disable_test

Specifies the test you don't want to be run. Can bu used more than
once to disable multiple tests.

Default: I<none> (i.e., run all default and C<additional_test> tests).

=head2 max_target_perl

Defines the highest minimum version of perl you intend to require.
This is passed to L<Dist::Zilla::Plugin::Test::MinimumVersion>, which generates
a F<minimum-version.t> test that'll warn you if you accidentally used features
from a higher version of perl than you wanted. (Having a lower required version
of perl is okay.)

Default: C<5.10>

=head2 weaver_config

Specifies the configuration for L<Pod::Weaver>.

Default: C<@Author::HAYOBAAN>.

=head2 tag_format

Specifies the format for tagging a release (see
L<Git::Tag|Dist::Zilla::Plugin::Git::Tag> for details).

Default: C<v%v%t>

=head2 version_regexp

Specifies the regexp for versions (see
L<Git::NextVersion|Dist::Zilla::Plugin::Git::NextVersion> for details).

Default: C<^v?([\d.]+)(?:-TRIAL)?$>

Note: only used in case of git version controlled repositories
(L<AutoVersion|Dist::Zilla::Plugin::AutoVersion> is used in case of
non-git version controlled repositories).

=for test_synopsis my @HAYOBAAN;

=for Pod::Coverage mvp_multivalue_args mvp_aliases

=for Pod::Coverage configure

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/HayoBaan/Dist-Zilla-PluginBundle-Author-HAYOBAAN/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 STABILITY

This module is still under development.

=head1 CREDITS

I took inspiration from many people's L<Dist::Zilla> and L<Pod::Weaver> PluginBundles. Most notably from:

=over 4

=item *

David Golden L<DAGOLDEN|https://metacpan.org/pod/Dist::Zilla::PluginBundle::DAGOLDEN>

=item *

Mike Dohorty L<DOHORTY|https://metacpan.org/pod/Dist::Zilla::PluginBundle::Author::DOHORTY>

=back

=head1 AUTHOR

Hayo Baan <info@hayobaan.nl>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Hayo Baan.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
