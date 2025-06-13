state("Lumina Rush"){}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Lumina Rush";
    vars.Helper.LoadSceneManager = true;
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
    {
		var autoSplit = mono["AutoSplitterData"];
		vars.Helper["runner"] = mono.Make<int>(
		    autoSplit,
			"isRunning"
		);
		return true;
    });
}

start
{
  if(current.runner == 1){
    old.runner = 1;
    return true;
  }
}

split
{
  if(old.runner == 1 && current.runner == 2){
    old.runner = 2;
    return true;
  }
}

isLoading{
  if(current.runner == 1){
	return false;
  }
  else if(current.runner == 2){
    return true;
  }
}

update
{
  current.Scene = vars.Helper.Scenes.Active.Index;
}