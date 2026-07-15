// Documentation available at https://donadigo.com/tminterface/plugins/api

string curr="";
bool set = false;

void OnCommandListChanged(CommandList@ prev, CommandList@ current, CommandListChangeReason reason)
{
    if(current !is null && current.Filename != ""){
        curr=current.Filename.Split("TMInterface\\Scripts\\")[1];
        set=true;
    }else{
        set=false;
    }
}

void OnMyCommand(int fromTime, int toTime, const string&in commandLine, const array<string>&in args) {
    log("recover_inputs " + curr);
    ExecuteCommand("recover_inputs " + curr);
}

void Main()
{
    RegisterCustomCommand("better_recover", "Recover inputs into current file", OnMyCommand);
}

void OnDisabled()
{
}

PluginInfo@ GetPluginInfo()
{
    auto info = PluginInfo();
    info.Name = "Better recover";
    info.Author = "Author";
    info.Version = "v1.0.0";
    info.Description = "Recover inputs into the current file";
    return info;
}
