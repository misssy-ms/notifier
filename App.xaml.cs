using Microsoft.Toolkit.Uwp.Notifications;
using System.IO;
using System.Media;
using System.Text;
using System.Windows;
namespace notifier
{
  public partial class App : Application
  {
    public string title = "新しい通知";
    public string index = "by notifier";
    public string icon = "";
    public string img = "";
    public bool roundedIcon = false;
    public bool heroImg = false;
    public string sound = "";
    public string textbox = "";
    public string sendBtn = "送信";
    public string btn1 = "";
    public string btn2 = "";
    public string btn3 = "";
    public string btn4 = "";
    public bool shiftJis = false;
    public string headerId = "999";
    public string headerTitle = "通知";
    private void Argument(StartupEventArgs e)
    {
      foreach (var arg in e.Args)
      {
        if (arg.StartsWith("--title="))
        {
          title = arg["--title=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--index="))
        {
          index = arg["--index=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--icon="))
        {
          icon = arg["--icon=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--img="))
        {
          img = arg["--img=".Length..].Trim('"');
        }
        else if (arg == "--roundedicon")
        {
          roundedIcon = true;
        }
        else if (arg == "--hero")
        {
          heroImg = true;
        }
        else if (arg.StartsWith("--sound="))
        {
          sound = arg["--sound=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--textbox="))
        {
          textbox = arg["--textbox=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--sendbtn="))
        {
          sendBtn = arg["--sendbtn=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--btn1="))
        {
          btn1 = arg["--btn1=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--btn2="))
        {
          btn2 = arg["--btn2=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--btn3="))
        {
          btn3 = arg["--btn3=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--btn4="))
        {
          btn4 = arg["--btn4=".Length..].Trim('"');
        }
        else if (arg == "--shiftjis")
        {
          shiftJis = true;
        }
        else if (arg.StartsWith("--headerid=") && int.Parse(arg["--headerid=".Length..].Trim('"')) == 1000) // ここを変更して規制解除
        {
          headerId = arg["--headerid=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--headertitle="))
        {
          headerTitle = arg["--headertitle=".Length..].Trim('"');
        }
        else if (arg.StartsWith("--headerid=") && int.Parse(arg["--headerid=".Length..].Trim('"')) < 999) // ここを変更して規制解除(不要な可能性有)
        {
          Environment.Exit(15);
        }
        else
        {
          Environment.Exit(16);
        }
      }
    }

    protected override void OnStartup(StartupEventArgs e)
    {
      base.OnStartup(e);

      ToastNotificationManagerCompat.OnActivated += toastArgs =>
      {
        // UI スレッドで処理を実行
        Current.Dispatcher.Invoke(() =>
        {
          string action = toastArgs.Argument;

          if (action.Contains("send"))
          {
            var userInput = toastArgs.UserInput["input"] as string;
            Encoder(userInput);
            Current.Shutdown(20);
          }
          else if (action.Contains("btn1"))
          {
            Current.Shutdown(21);
          }
          else if (action.Contains("btn2"))
          {
            Current.Shutdown(22);
          }
          else if (action.Contains("btn3"))
          {
            Current.Shutdown(23);
          }
          else if (action.Contains("btn4"))
          {
            Current.Shutdown(24);
          }
          else
          {
            Environment.Exit(17);
          }

        });
      };

      Argument(e);

      SendNonfiction();

      if (textbox == "" && btn1 == "" && btn2 == "" && btn3 == "" && btn4 == "")
        this.Shutdown(0);
    }

    void SendNonfiction()
    {
      var n = new ToastContentBuilder()
        .AddHeader(headerId, headerTitle, "action=openConversation&id=" + headerId)
        .AddArgument("action", "viewConversation")
        .AddText(title)
        .AddText(index);
      if (icon != "")
      {
        try
        {
          string relativePath = icon;  // 相対パス
          string path = Path.GetFullPath(relativePath); // 絶対パスに変換
          using var stream = File.OpenRead(path);
          Uri uri = new(path);
          if (roundedIcon) n.AddAppLogoOverride(uri, ToastGenericAppLogoCrop.Circle);
          else n.AddAppLogoOverride(uri);
        }
        catch
        {
          Environment.Exit(11);
        }
      }
      if (img != "")
      {
        try
        {
          string relativePath = @img;  // 相対パス
          string path = Path.GetFullPath(relativePath); // 絶対パスに変換
          using var stream = File.OpenRead(path);
          Uri uri = new(path);
          if (!heroImg)
          {
            n.AddInlineImage(uri);
          }
          else
          {
            n.AddHeroImage(uri);
          }
        }
        catch
        {
          Environment.Exit(12);
        }
      }
      if (textbox != "")
      {
        n.AddInputTextBox("input", "ここに返信を入力")
        .AddButton(new ToastButton()
          .SetContent(sendBtn)
          .AddArgument("action", "send")
          .SetTextBoxId("input")
          .SetBackgroundActivation());
      }
      if (btn1 != "")
      {
        n.AddButton(new ToastButton()
          .SetContent(btn1)
          .AddArgument("action", "btn1")
          .SetBackgroundActivation());
      }
      if (btn2 != "")
      {
        n.AddButton(new ToastButton()
          .SetContent(btn2)
          .AddArgument("action", "btn2")
          .SetBackgroundActivation());
      }
      if (btn3 != "")
      {
        n.AddButton(new ToastButton()
          .SetContent(btn3)
          .AddArgument("action", "btn3")
          .SetBackgroundActivation());
      }
      if (btn4 != "")
      {
        n.AddButton(new ToastButton()
          .SetContent(btn4)
          .AddArgument("action", "btn4")
          .SetBackgroundActivation());
      }
      try
      {
        n.Show();
      }
      catch
      {
        Environment.Exit(14);
      }
      if (sound != "")
      {
        try
        {
          SoundPlayer audio = new(sound);
          audio.Load();
          audio.PlaySync();
        }
        catch
        {
          Environment.Exit(13);
        }
      }
    }

    private void Encoder(string? text)
    {
      try
      {
        string encStr = "Shift_JIS";
        if (!shiftJis) encStr = "UTF-8";
        Encoding enc = Encoding.GetEncoding(encStr);
        StreamWriter writer = new(@"notifier_text.txt", false, enc);
        writer.WriteLine(text);
        writer.Close();
      }
      catch
      {
        Environment.Exit(18);
      }
    }
  }
}
