-- BSD 3-Clause License

-- Copyright (c) 2025, frazy

-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:

-- 1. Redistributions of source code must retain the above copyright notice, this
--    list of conditions and the following disclaimer.

-- 2. Redistributions in binary form must reproduce the above copyright notice,
--    this list of conditions and the following disclaimer in the documentation
--    and/or other materials provided with the distribution.

-- 3. Neither the name of the copyright holder nor the names of its
--    contributors may be used to endorse or promote products derived from
--    this software without specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
-- FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
-- SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
-- CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-- OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

local stringham = { version = "1.1" }





--Returns the character at index `index` in string `str`.
function stringham.getChar(str, index)
    return string.sub(str, index, index)
end

--Returns all the items of a table (list) of strings `listOfStrings` prefixed with string `prefix`.
function stringham.prefix(listOfStrings, prefix)
    local newt = {}
    for _, str in ipairs(listOfStrings) do
        table.insert(newt, prefix .. str)
    end
    return newt
end

--Returns all the items of a table (list) of strings `listOfStrings` suffixed with string `suffix`.
function stringham.suffix(listOfStrings, suffix)
    local newt = {}
    for _, str in ipairs(listOfStrings) do
        table.insert(newt, str .. suffix)
    end
    return newt
end

--Returns `string1` with `string2` placed inside `string1` at the index `positionToPlaceString2`.
function stringham.infix(string1, string2, positionToPlaceString2)
    return string.sub(string1, 1, positionToPlaceString2) .. string2 .. string.sub(string1, positionToPlaceString2 + 1)
end

--Supply a string `str` and a separator `separator` (single character). Returns a table containing the substrings of the string split by the separator (all substrings excluding the separator). If `separator` is an empty string or is nil, this function instead returns a table containing each letter of `str` as separate items.
function stringham.split(str, separator)
    assert(not separator or #separator <= 1, "separator must be nil or must be 0 or 1 characters long.")
    local t = ((separator and #separator > 0) and {""} or {})
    for i = 1, #str do
        local char = string.sub(str,i,i)
        if separator and #separator > 0 then
            if char == separator then
                t[#t+1] = ""
            else
                t[#t] = t[#t]..char
            end
        else
            t[#t+1] = char
        end
    end
    return t
end

--Returns string `str` with the first letter of each word (separated by spaces) capitalized. If boolean `forceLower` is true (nil by default), the letters of each word in `str` other than the first letter will be put into lowercase.
function stringham.titleCaps(str, forceLower)
    local words = stringham.split(str, " ")
    local newStr = ""
    for _, word in ipairs(words) do
        word = string.upper(string.sub(word, 1, 1)) .. (forceLower and string.lower or function(x) return x end)(string.sub(word, 2))
        newStr = newStr .. word .. " "
    end
    return string.sub(newStr, 1, #newStr - 1)
end

--Returns a string containing each item of table `tableOfStrings` (a list of strings) concatenated sequentially, separated by string `separator`. A function `finder` can optionally be included, where each item of the list is passed as an argument to `finder` and the return values of `finder(x)` are then used in the sequential concatenation.
function stringham.compositeList(tableOfStrings, separator, finder)
    local newStr = ""
    for index, str in ipairs(tableOfStrings) do
        newStr = newStr .. (finder and finder(str) or str) .. (index < #tableOfStrings and separator or "")
    end
    return newStr
end

--Returns string `str` with all of its letters randomly capitalized or uncapitalized.
function stringham.wonky(str)
    local newStr = ""
    for i = 1, #str do
        local char = string.sub(str, i, i)
        newStr = newStr .. (math.random(2) == 1 and string.upper or string.lower)(char)
    end
    return newStr
end

--Returns a table (dictionary) where each key-value pair has a word as its key and the number of instances of the word in the string `str`. For example, `stringham.countWordInstances("Hi and hello and goodbye.")` returns `{ ["Hi"] = 1, ["and"] = 2, ["hello"] = 1, ["goodbye"] = 1 }`
function stringham.countWordInstances(str)
    local words = stringham.split(str, " ")
    local data = {}
    for _, word in ipairs(words) do
        local i, j = string.find(word, "%P+"); word = string.sub(word, i, j)
        data[word] = (data[word] and data[word] + 1 or 1)
    end
    return data
end

--Returns `str` with its characters shuffled randomly. This function ensures it never returns `str` verbatim by pure coincidence. If boolean `ignoreSingleCharacterError` is true (nil by default), this function will not throw an error when `str` is only one character long and will instead return `str`.
function stringham.scramble(str, ignoreSingleCharacterError)
    assert(#str ~= 0, "Cannot scramble an empty string.")
    if ignoreSingleCharacterError then return str else assert(#str ~= 1, "Because the string supplied to stringham.scramble is only 1 character long, stringham cannot scramble the string.") end
    local newStr
    repeat
        newStr = ""
        local letters = stringham.split(str)
        repeat
            newStr = newStr .. table.remove(letters, math.random(#letters))
        until #letters == 0
    until newStr ~= str
    return newStr
end

--Returns "No problem, buddy."
function stringham.thanks()
    return "No problem, buddy."
end





return stringham