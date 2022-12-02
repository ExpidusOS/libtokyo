namespace TokyoGtk {
  public class ApplicationWindow : Adw.ApplicationWindow, BaseWindow, Gtk.Buildable {
    private Adw.HeaderBar _header;
    private Gtk.Box _content;
    private uint _id;
    private Provider? _provider;

    public Adw.HeaderBar header {
      get {
        return this._header;
      }
    }

    public uint id {
      get {
        if (this._id == 0) this._id = next_window_id++;
        return this._id;
      }
    }

    public Provider? provider {
      get {
        return this._provider;
      }
      construct {
        this._provider = value;
      }
    }

    public ApplicationWindow(Gtk.Application ?app) {
      Object(application: app);
    }

    construct {
      this._content = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
      this._header  = new Adw.HeaderBar();

      this.init();
    }

    public void reset_content() {
      this.set_content(this._content);
    }

    public Gtk.Box get_box() {
      return this._content;
    }

    public void add_child(Gtk.Builder builder, GLib.Object child, string? type) {
      if (type == null) {
        this.get_box().add_child(builder, child, null);
      } else if (type == "header") {
        this.header.add_child(builder, child, null);
      }
    }
  }
}
