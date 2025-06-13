state("Lumina Rush") { }

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Lumina Rush";
    // vars.Helper.AlertLoadless();
}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
    {
        // 1: StartPoint.Begin
        // 2: LevelManager.LoadLevel, EndPortal.Win
        vars.Helper["RunState"] = mono.Make<int>("AutoSplitterData", "isRunning");

        return true;
    });
}

start
{
    return old.RunState != 1 && current.RunState == 1;
}

split
{
    return old.RunState == 1 && current.RunState == 2;
}

isLoading
{
    return current.RunState == 2;
}
