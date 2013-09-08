var get = Ember.get, isNone = Ember.isNone;

App.ActiveModelSerializer = DS.RESTSerializer.extend({
  defaultSerializer: '_ams',
  pathForType: function(type) {
    var decamelized = Ember.String.decamelize(type);
    return Ember.String.pluralize(decamelized);
  },

  keyForAttribute: function(attr) {
    return Ember.String.decamelize(attr);
  },

  keyForRelationship: function(key, kind) {
    key = Ember.String.decamelize(key);
    if (kind === "belongsTo") {
      return key + "_id";
    } else if (kind === "hasMany") {
      return Ember.String.singularize(key) + "_ids";
    } else {
      return key;
    }
  },

  serializeAttribute: function(record, json, key, attribute) {
    var attrs = get(this, 'attrs');
    var value = get(record, key), type = attribute.type;

    if (type) {
      var transform = this.transformFor(type);
      value = transform.serialize(value);
    }

    // if provided, use the mapping provided by `attrs` in
    // the serializer
    var rootKey = attrs && attrs[key] || this.keyForAttribute ? this.keyForAttribute(key) : key;

    json[rootKey] = value;
  },

  serializeBelongsTo: function(record, json, relationship) {
    var key = relationship.key,
        rootKey = this.keyForRelationship ? this.keyForRelationship(key, "belongsTo") : key;

    var belongsTo = get(record, key);

    if (isNone(belongsTo)) { return; }

    json[rootKey] = get(belongsTo, 'id');

    if (relationship.options.polymorphic) {
      json[this.keyForPolymorphicType(key)] = this.valueForPolymorphicType(belongsTo.constructor.typeKey);
    }
  },

  serializeHasMany: Ember.K,

  serializeIntoHash: function(data, type, record, options) {
    var root = this.rootForModelType(type.typeKey);
    data[root] = this.serialize(record, options);
  },

  rootForModelType: function(type) {
    return Ember.String.decamelize(type);
  },

  modelTypeFromRoot: function(root) {
    var camelized = Ember.String.camelize(root);
    return Ember.String.singularize(camelized);
  },

  keyForPolymorphicType: function(typeKey) {
    return this.keyForAttribute(typeKey) + "_type";
  },

  valueForPolymorphicType: function(typeKey) {
    return Ember.String.capitalize(typeKey);
  }
});

