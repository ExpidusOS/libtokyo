namespace TokyoGtk {
  public class ApplicationWindow : Adw.ApplicationWindow {
    private Adw.HeaderBar _header;
    private Gtk.Box _content;

    public Adw.HeaderBar header {
      get {
        return this.header;
      }
    }

    public ApplicationWindow(Gtk.Application app) {
      Object(application: app);
    }

    construct {
      this._content = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
      this._header = new Adw.HeaderBar();
      this._content.append(this._header);

      this.reset_content();
    }

    public void reset_content() {
      this.set_content(this._content);
    }

    public Gtk.Box get_box() {
      return this._content;
    }
  }
}
