class Utility{
    static [Object] pickOneRandom([Object[]] $Elements){
        [Int] $RandomPos = Get-Random -Maximum $Elements.Length
        return $Elements[$RandomPos]
    }
}