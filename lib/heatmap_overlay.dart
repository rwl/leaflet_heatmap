library leaflet_heatmap.heatmap_overlay;

import 'dart:js';
import 'package:leaflet/leaflet.dart';

class HeatmapOverlay implements Layer {
  final JsObject layer;

  factory HeatmapOverlay(
      {

      /// Scales the radius based on map zoom.
      bool scaleRadius,

      /// If set to false the heatmap uses the global maximum for colorization
      /// if activated: uses the data maximum within the current map boundaries
      /// (there will always be a red spot with useLocalExtremas true).
      bool useLocalExtrema,

      /// Which field name in your data represents the latitude.
      String latField: 'lat',

      /// Which field name in your data represents the longitude.
      String lngField: 'lng',

      /// A background color string in form of hexcode, color name, or rgb(a).
      String backgroundColor,

      /// An object that represents the gradient (syntax: number string [0,1] :
      /// color string).
      gradient,

      /// The radius each datapoint will have (if not specified on the
      /// datapoint itself).
      num radius,

      /// A global opacity for the whole heatmap. This overrides maxOpacity
      /// and minOpacity if set! Default = 0.6
      num opacity,

      /// The maximal opacity the highest value in the heatmap will have.
      /// (will be overridden if opacity set)
      num maxOpacity,

      /// The minimum opacity the lowest value in the heatmap will have.
      /// (will be overridden if opacity set)
      num minOpacity,

      /// Pass a callback to receive extrema change updates. Useful for DOM
      /// legends.
      Function onExtremaChange,

      /// The blur factor that will be applied to all datapoints. The higher
      /// the blur factor is, the smoother the gradients will be.
      /// Default = 0.85
      num blur,

      /// The property name of your x coordinate in a datapoint. Default = "x"
      String xField,

      /// The property name of your y coordinate in a datapoint. Default = "y"
      String yField,

      /// The property name of your y coordinate in a datapoint.
      /// Default = "value"
      String valueField}) {
    var cfg = {};
    if (scaleRadius != null) cfg['scaleRadius'] = scaleRadius;
    if (useLocalExtrema != null) cfg['useLocalExtrema'] = useLocalExtrema;
    if (latField != null) cfg['latField'] = latField;
    if (lngField != null) cfg['lngField'] = lngField;
    if (backgroundColor != null) cfg['backgroundColor'] = backgroundColor;
    if (gradient != null) cfg['gradient'] = gradient;
    if (radius != null) cfg['radius'] = radius;
    if (opacity != null) cfg['opacity'] = opacity;
    if (maxOpacity != null) cfg['maxOpacity'] = maxOpacity;
    if (minOpacity != null) cfg['minOpacity'] = minOpacity;
    if (onExtremaChange != null) cfg['onExtremaChange'] = onExtremaChange;
    if (blur != null) cfg['blur'] = blur;
    if (xField != null) cfg['xField'] = xField;
    if (yField != null) cfg['yField'] = yField;
    var _cfg = new JsObject.jsify(cfg);
    var args = [_cfg];
    var overlay = new JsObject(context['HeatmapOverlay'], args);
    return new HeatmapOverlay._(overlay);
  }

  HeatmapOverlay._(this.layer) {
    if (layer == null) {
      throw new ArgumentError.notNull('layer');
    }
  }

  /// Behaves just like the standard heatmap.js `setData`.
  void setData(Map data) {
    layer.callMethod('setData', [new JsObject.jsify(data)]);
  }

  /// Behaves just like the standard heatmap.js `addData`.
  void addData(data) {
    var _data = (data is Map) ? new JsObject.jsify(data) : data;
    layer.callMethod('addData', [_data]);
  }
}
