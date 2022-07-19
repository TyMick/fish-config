# Ported from Oh My Zsh (https://github.com/ohmyzsh/ohmyzsh/blob/249c708/lib/git.zsh#L92-L105)
#
# Original source license:
#
# # MIT License
# #
# # Copyright (c) 2009-2022 Robby Russell and contributors (https://github.com/ohmyzsh/ohmyzsh/contributors)
# #
# # Permission is hereby granted, free of charge, to any person obtaining a copy
# # of this software and associated documentation files (the "Software"), to deal
# # in the Software without restriction, including without limitation the rights
# # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# # copies of the Software, and to permit persons to whom the Software is
# # furnished to do so, subject to the following conditions:
# #
# # The above copyright notice and this permission notice shall be included in all
# # copies or substantial portions of the Software.
# #
# # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# # SOFTWARE.


# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch
    set -l ref (command git symbolic-ref --quiet HEAD 2> /dev/null)
    set -l ret $status
    if test $ret != 0
        test $ret = 128 && return  # no git repo.
        set ref (command git rev-parse --short HEAD 2> /dev/null) || return
    end
    string replace --filter --regex ^refs/heads/ '' $ref || echo $ref
end
