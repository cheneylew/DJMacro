git tag -m "" 0.4.0
git push --tags
podspec=$(ls *.podspec)
pod repo push Specs ${podspec} --allow-warnings
pod repo update
