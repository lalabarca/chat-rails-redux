/* eslint no-bitwise:off */

import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { selectChannel, fetchMessages } from '../actions/index';
import { Link } from "react-router-dom";

class ChannelList extends Component {
  handleClick = (channel) => {
    this.props.selectChannel(); // Will empty message list first
    this.props.fetchMessages(channel);
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.selectedChannel !== this.props.selectedChannel) {
      this.props.fetchMessages(nextProps.selectedChannel);
    }
  }

  renderChannel = (channel) => {
    return (
      <li
        key={channel}
        className={channel === this.props.selectedChannel ? 'active' : null}
        role="presentation"
        onClick={() => this.handleClick(channel)}
      >
        <Link to={`/channels/${channel}`}>
          #{channel}
        </Link>
      </li>
    );
  }

  render() {
    return (
      <div className="channels-container">
        <span>Redux Chat</span>
        <ul>
          {this.props.channels.map(this.renderChannel)}
        </ul>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    channels: state.channels
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ selectChannel, fetchMessages }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ChannelList);
