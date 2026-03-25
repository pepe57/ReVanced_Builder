# https://github.com/MorpheApp/morphe-patches

$Parameters = @{
	Uri             = "https://api.github.com/repos/MorpheApp/morphe-patches/releases/latest"
	UseBasicParsing = $true
	Verbose         = $true
}
$MorphePatchesvtag = (Invoke-RestMethod @Parameters).tag_name
$MorphePatchestag = $Patchesvtag.replace("v", "")

$Parameters = @{
	Uri             = "https://github.com/MorpheApp/morphe-patches/releases/download/$MorphePatchesvtag/patches-$MorphePatchestag.mpp"
	Outfile         = "Morphe_Builder\morphe-patches.mpp"
	UseBasicParsing = $true
	Verbose         = $true
}
Invoke-RestMethod @Parameters

echo "MorphePatchestag=$MorphePatchestag" >> $env:GITHUB_ENV
