var Post = React.createClass({
  propTypes: {
    body: React.PropTypes.string,
    post_id: React.PropTypes.string,
    forum_title: React.PropTypes.string,
    topic_title: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
      {this.props.body}
      </div>
    );
  }
});