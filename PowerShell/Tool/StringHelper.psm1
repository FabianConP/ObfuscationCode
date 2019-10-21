class StringHelper{
    [String] $Content
    [Bool] $NoSpaceAfter

    StringHelper(){
        $this.Content = ""
        $this.NoSpaceAfter = $False
    }

    [StringHelper] Append([Object[]] $Elements){
        if($Elements -ne $null){
            ForEach($Element in $Elements){
                $this.Append($Element)
            }
        }
        return $this
    }

    [StringHelper] Append([Object] $Element){
        if($Element -ne $null){
            if($this.Content.Length -eq 0){
                $this.Content = $Element.ToString()
            }Else{
                If($this.Content[$this.Content.Length - 1] -ne " " -and -Not ($this.NoSpaceAfter)){
                    $this.Content += " "
                }
                $this.Content += $Element.ToString()
            }
            $this.NoSpaceAfter = $False    
        }
        return $this
    }

    [StringHelper] NoSpace(){
        $this.NoSpaceAfter = $True
        return $this
    }

    [StringHelper] NewLine(){
        $this.Content += "`n"
        return $this
    }

    [String] ToString(){
        return $this.Content
    }
}