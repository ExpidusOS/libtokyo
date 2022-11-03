namespace TokyoGtk {
  public class CalendarEvents : Gtk.Box {
    private Adw.ViewSwitcherTitle _title;
    private Adw.ViewStack _stack;

    public Gtk.Calendar calendar { get; }
    public Gtk.ListBox events_list { get; }

    public CalendarEvents() {
      Object();
    }

    class construct {
      set_css_name("calendarevents");
    }

    construct {
      this.orientation = Gtk.Orientation.VERTICAL;
      this.spacing = 10;

      this._title = new Adw.ViewSwitcherTitle();
      this._title.get_style_context().add_class("title");
      this._title.title = _("Calendar");
      this.append(this._title);

      this._stack = new Adw.ViewStack();
      this._stack.get_style_context().add_class("stack");
      this._stack.hexpand = true;
      this._stack.vexpand = true;
      this._title.stack = this._stack;
      this.append(this._stack);

      this._calendar = new Gtk.Calendar();
      this._calendar.get_style_context().add_class("calendar");
      this._calendar.hexpand = true;
      this._calendar.vexpand = true;
      this._stack.add_titled(this._calendar, "calendar", _("Calendar"));

      this._events_list = new Gtk.ListBox();
      this._events_list.get_style_context().add_class("events");
      this._events_list.hexpand = true;
      this._events_list.vexpand = true;
      this._stack.add_titled(this._events_list, "events", _("Events"));
    }
  }
}
