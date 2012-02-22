rm -rf BUILD RPMS SRPMS tmp || true
mkdir -p BUILD RPMS SRPMS SOURCES
if [ ! -f SOURCES/pwauth-$version.tar.gz ];
then
        wget "http://dansguardian.org/downloads/2/Stable/dansguardian-2.10.1.1.tar.gz" -O SOURCES/dansguardian-2.10.1.1.tar.gz
    fi

rpmbuild -ba --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="_jenkinsbuild $JENKINS_BUILD" SPEC/dansguardian.spec
