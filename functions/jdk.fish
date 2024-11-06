# Source: https://github.com/AdoptOpenJDK/homebrew-openjdk/blob/27915e4ab3856595a8b46d1fd3b6c379c1f02210/README.md#switch-between-different-jdk-versions

function jdk
	set java_version $argv
	set -Ux JAVA_HOME (/usr/libexec/java_home -v $java_version)
	java -version
end
